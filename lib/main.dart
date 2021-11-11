import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/daum.dart';
import 'package:webview_tabbar_app/google.dart';
import 'package:webview_tabbar_app/naver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        children: const [NaverApp(), GoogleApp(), DaumApp()],
        controller: controller,
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(
          labelColor: Colors.blueAccent,
          controller: controller,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/naver.png',
                width: 30,
                height: 30,
              ),
              text: '네이버',
            ),
            Tab(
              icon: Image.asset(
                'images/google.png',
                width: 30,
                height: 30,
              ),
              text: '구글',
            ),
            Tab(
              icon: Image.asset(
                'images/daum.png',
                width: 30,
                height: 30,
              ),
              text: '다음',
            ),
          ],
        ),
      ),
    );
  }
}
