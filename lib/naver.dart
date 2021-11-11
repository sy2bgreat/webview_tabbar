import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/web_action.dart';

class NaverApp extends StatefulWidget {
  const NaverApp({Key? key}) : super(key: key);

  @override
  _NaverAppState createState() => _NaverAppState();
}

class _NaverAppState extends State<NaverApp> {
  @override
  Widget build(BuildContext context) {
    return const WebAction(siteName: 'www.naver.com');
  }
}
