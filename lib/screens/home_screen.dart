import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebViewController _webViewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      )
      ..loadRequest(Uri.parse('https://m.youtube.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'YouTube Lite',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(controller: _webViewController),
      drawer: Drawer(
        backgroundColor: const Color(0xFF0F0F0F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0F0F0F),
              ),
              child: Text(
                'YouTube Lite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://m.youtube.com/'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flash_on, color: Colors.white),
              title: const Text('Shorts', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/shorts'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.subscriptions, color: Colors.white),
              title: const Text('Subscription', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/feed/subscriptions'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore, color: Colors.white),
              title: const Text('Explore', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/feed/explore'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up, color: Colors.white),
              title: const Text('Trending', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/feed/trending'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.white),
              title: const Text('History', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/feed/history'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.watch_later, color: Colors.white),
              title: const Text('Watch Later', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/playlist?list=WL'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up, color: Colors.white),
              title: const Text('Liked Videos', style: TextStyle(color: Colors.white)),
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://www.youtube.com/playlist?list=LL'));
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white54),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: const Text('Help', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}