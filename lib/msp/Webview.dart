import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String URL_YOUTUBE = 'https://www.youtube.com/';
const String URL_INSTAGRAM = 'https://www.instagram.com/';
const String URL_TWITCH = 'https://www.twitch.tv/';

class WebViewScreen extends StatefulWidget {

  String _reqURL = 'http://www.youtube.com/';
  WebViewScreen(String url)
  {
    _reqURL = url;
  }



  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  @override
  void initState() {
    super.initState();
  }


  late WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setUserAgent("random")
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {
        },
        onPageFinished: (String url) {
        },
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse(widget._reqURL));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: WebViewWidget(
            controller: webViewController,
          ),
        ),
      ),
    );
  }
}