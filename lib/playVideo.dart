import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Playvideo extends StatefulWidget {
  final String name;
  final String link;

   Playvideo({required this.name, required this.link});


  @override
  State<Playvideo> createState() => _PlayvideoState();
}

class _PlayvideoState extends State<Playvideo> {
 late final WebViewController controller;
 @override
  void initState() {

    controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(widget.link));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(fontFamily: "Poppins",fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child:WebViewWidget(
          controller: controller,
        )
      ),
    );
  }
}
