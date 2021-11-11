import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/web_action.dart';

class GoogleApp extends StatefulWidget {
  const GoogleApp({Key? key}) : super(key: key);

  @override
  _GoogleAppState createState() => _GoogleAppState();
}

class _GoogleAppState extends State<GoogleApp> {
  @override
  Widget build(BuildContext context) {
    return const WebAction(siteName: 'www.google.com');
  }
}
