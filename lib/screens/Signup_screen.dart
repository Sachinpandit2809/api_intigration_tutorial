import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
//here http is optional so if we remove from here we should remove from everey line of post api

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void loginFunction(String email, String password) async {
    try {
      //here http is optional because i used http in import as a snippets
      http.Response response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, "password": password});
      if (response.statusCode == 200) {
        print("Login success fully");
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
      } else {
        print(" Login failed");
      }
    } catch (e) {
      print((" error in login Fumction\n" + e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Screen"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "SignUp",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                loginFunction(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                //width: 200,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("LoginUP")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
