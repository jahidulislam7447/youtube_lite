import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late WebViewController _webViewController;
  bool _isSearched = false;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF0F0F0F))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      );
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _isSearched = true;
      });
      String searchQuery = Uri.encodeComponent(query);
      _webViewController.loadRequest(
        Uri.parse('https://m.youtube.com/results?search_query=$searchQuery'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        title: TextField(
          controller: _searchController,
          onSubmitted: _performSearch,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search YouTube',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey[500]),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _isSearched = false;
                });
              },
            ),
            filled: true,
            fillColor: const Color(0xFF272727),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      body: _isSearched
          ? WebViewWidget(controller: _webViewController)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 64, color: Colors.grey[500]),
                  const SizedBox(height: 16),
                  Text(
                    'Search for videos',
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}