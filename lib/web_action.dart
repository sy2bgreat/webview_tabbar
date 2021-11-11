import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebAction extends StatefulWidget {
  final String siteName;
  const WebAction({Key? key, required this.siteName}) : super(key: key);

  @override
  _WebActionState createState() => _WebActionState();
}

class _WebActionState extends State<WebAction> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isloading = true; // for indicator
  // ----
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('WebView'),
      // ),
      body: Stack(children: [
        WebView(
          initialUrl: 'https://${widget.siteName}',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageFinished: (finish) {
            setState(() {
              isloading = false;
            });
          },
          onPageStarted: (start) {
            setState(() {
              isloading = true;
            });
          },
        ),
        isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ]),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: const Icon(Icons.arrow_back),
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        controller.data!.goBack();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: const Icon(Icons.replay),
                      backgroundColor: Colors.yellow,
                      onPressed: () {
                        controller.data!.reload();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: const Icon(Icons.arrow_forward),
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        controller.data!.goForward();
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Stack();
        },
      ),
    );
  }
}
