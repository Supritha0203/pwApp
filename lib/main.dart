import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            // detect Android back button click
            final controller = webViewController;
            if (controller != null) {
              if (await controller.canGoBack()) {
                controller.goBack();
                return false;
              }
            }
            return true;
          },
          child: Scaffold(
              // appBar: AppBar(
              //   title: const Text("PossibleWorks"),
              // ),
              body: Column(children: <Widget>[
                Expanded(
                  child: InAppWebView(
                    key: webViewKey,
                    
                    // gestureRecognizers:,
                    initialUrlRequest:
                    URLRequest(url: Uri.parse("https:r.lykkebook.com")),
                    // initialSettings: InAppWebViewSettings(
                    //     allowsBackForwardNavigationGestures: true),
                    
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
