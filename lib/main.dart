import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // String _respone = "";

  void _incrementCounter() {
    setState(() {
      print("哈哈哈哈哈哈");
      _counter += 8;
      getNet();
      // Fluttertoast.showToast(
      //     msg: "This is Center Short Toast2",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0);
    });
  }

  void getNet() {
    print("发起网络请求");

    ///
    Uri getUri =
        Uri.https("csdn-1595-apk.s3.cn-north-1.jdcloud-oss.com", "/wa.json");

    http
        .get(getUri)
        .then((responeString) => {print("响应" + responeString.body.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (_incrementCounter),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
