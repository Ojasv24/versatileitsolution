import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:versatileitsolution/web_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Login Page",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        Form(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your username',
                  labelText: 'Username',
                ),
                controller: usernameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Enter a your password',
                  labelText: 'Password',
                ),
                controller: passwordController,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Login'),
                    // SizedBox(width: 10),
                    Icon(Icons.login),
                  ],
                ),
                onPressed: () async {
                  final username = usernameController.text;
                  final password = passwordController.text;
                  var url = Uri.parse(
                      'http://www.novabizbusiness.com/Webservice/Service.asmx/LoginMember?IDNo=$username&Password=$password');

                  var req = http.Request('GET', url);
                  var res = await req.send();
                  final resBody = await res.stream.bytesToString();
                  final json = jsonDecode(resBody);
                  final status = json['Status'];
                  if (context.mounted) {
                    if (status == 'True') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebView(
                                username: username, password: password)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(json['Message']),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        )),
      ],
    );
  }
}
