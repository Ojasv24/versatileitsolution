import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:versatileitsolution/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Center(
            child: (snapshot.hasData)
                ? snapshot.data! == 'True'
                    ? const LoginPage()
                    : const Text('Server is down')
                : const CircularProgressIndicator(),
          ),
        );
      },
      future: getStatus(),
    );
  }
}

Future<String> getStatus() async {
  var url = Uri.parse(
      'http://www.novabizbusiness.com/Webservice/Service.asmx/CheckAppRunningStatus');
  var req = http.Request('GET', url);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  final json = jsonDecode(resBody);
  final status = json['Status'];
  return status;
}
