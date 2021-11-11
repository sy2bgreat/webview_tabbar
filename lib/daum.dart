import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/web_action.dart';

class DaumApp extends StatefulWidget {
  const DaumApp({Key? key}) : super(key: key);

  @override
  _DaumAppState createState() => _DaumAppState();
}

class _DaumAppState extends State<DaumApp> {
  @override
  Widget build(BuildContext context) {
    return const WebAction(siteName: 'www.daum.net');
  }
}
