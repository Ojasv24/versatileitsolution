import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.username, required this.password});
  final String username;
  final String password;
  @override
  Widget build(BuildContext context) {
    final encryptedUsername = base64Encode(utf8.encode(username));
    final encryptedPassword = base64Encode(utf8.encode(password));
    final controller = WebViewController()
      ..loadRequest(Uri.parse(
          'http://www.novabizbusiness.com/Dashboard/MEmberLogin.aspx?Auth=$encryptedUsername&AuthBy=$encryptedPassword&type=2'));
    return Scaffold(
      // appBar: AppBar(title: const Text('Web View')),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
