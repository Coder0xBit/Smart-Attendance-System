import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool passwordVisible = false;
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailErrorMessage;
  String? passwordErrorMessage;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool validateLogin() {
    bool isTrueEmail = false;
    bool isTruePassword = false;
    bool isEmailEmpty = false;
    bool isPasswordEmpty = false;

    if (emailIdController.text.isEmpty) {
      isEmailEmpty = true;
      setState(() {
        emailErrorMessage = "Email Can't be empty";
      });
    }

    if (passwordController.text.isEmpty) {
      isPasswordEmpty = true;
      setState(() {
        passwordErrorMessage = "Password Can't be empty";
      });
    }

    if (emailIdController.text.isEmpty || passwordController.text.isEmpty) {
      return !isEmailEmpty || !isPasswordEmpty;
    }

    if (emailIdController.text != "123@gmail.com") {
      setState(() {
        emailErrorMessage = "Wrong Email";
      });
    } else if (emailIdController.text == "123@gmail.com") {
      isTrueEmail = true;
      setState(() {
        emailErrorMessage = null;
      });
    }
    if (passwordController.text != "123") {
      setState(() {
        passwordErrorMessage = "Wrong Password";
      });
    } else if (passwordController.text == "123") {
      isTruePassword = true;
      setState(() {
        passwordErrorMessage = null;
      });
    }

    return isTrueEmail && isTruePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 150.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("Welcome Back",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            const Text("Enter Your Login Credential",
                style:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal)),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TextField(
                controller: emailIdController,
                obscureText: false,
                decoration: InputDecoration(
                    errorText: emailErrorMessage,
                    prefixIcon: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Faculty ID"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: passwordController,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                    errorText: passwordErrorMessage,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 55.0,
                child: FilledButton(
                    onPressed: () {
                      if (validateLogin()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MainScaffold(title: "Attendence")));
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "Forgot Your Password ?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
