import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        String? url = await controller.currentUrl();
        if (url == 'https://needmedi.com/') {
          return true;
        } else {
          controller.goBack();
          return false;
        }
      },
      child: GestureDetector(
        child: Scaffold(
          body: SafeArea(
            child: WebView(
              userAgent: '/91.0.4472.120',
              initialUrl: 'https://needmedi.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController wc) {
                controller = wc;
              },
            ),
          ),
        ),
      ),
    );
  }
}
