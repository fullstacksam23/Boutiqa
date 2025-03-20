import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Cahc extends StatelessWidget {
  const Cahc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFEDE3D8),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: 'http:192.168.27.207:5000',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {},
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {
                print("Web resource error: $error");
              },
            ),
          ),
        ],
      ),
    );
  }
}