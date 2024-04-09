import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Webview extends StatefulWidget {
  const Webview({super.key});

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final WebViewController controller;
  void initState(){
    super.initState();
    controller=WebViewController()
      ..loadRequest(
          Uri.parse("https://www.inc.in/media/photos")
      );

  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title:Text(""),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.deepOrange, Colors.orangeAccent]),
          ),
        ),
      ),
      body:WebViewWidget(controller: controller,

      ),
    );
  }
}
