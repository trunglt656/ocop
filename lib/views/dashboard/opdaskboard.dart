import 'package:ecommerce_store/views/dashboard/embed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebViewDB extends StatelessWidget {
  const WebViewDB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WebView Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("đ test"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const MyWebView());
            },
            child: const Text("Open WebView"),
          ),
        ));
  }
}
