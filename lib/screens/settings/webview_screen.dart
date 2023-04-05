import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://comentor.id/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: AppBar
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.grey[900],
        title: Text(
          Texts.titleWeb(),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
