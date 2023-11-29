import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    // Use WillPopScope đề call back
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    "https://bduedu-my.sharepoint.com/:p:/g/personal/20050014_student_bdu_edu_vn/Ef96rvMRsz9HtdhveDuWiXcBm-PNQtXQtoHpyrSleRPRMw")),
            onWebViewCreated: (InAppWebViewController controller) {
              inAppWebViewController = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? LinearProgressIndicator(
                  value: _progress,
                )
              : const SizedBox()
        ],
      )),
    );
  }
}
