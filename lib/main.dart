import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

/// 如果需要调整窗口的大小，则需要引入bitsdojo_window组件
void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(1000, 800);
    appWindow.minSize = Size(800, 600);
    appWindow.maxSize = Size(1500, 1000);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MoveWindow(
        onDoubleTap: () {},
        child: DashboardPage(),
      ),
    );
  }
}
