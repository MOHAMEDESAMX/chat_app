import 'package:chat_app/core/shared_widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class LoginButtom extends StatelessWidget {
  const LoginButtom(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.onSuccess,
      required this.globalKey});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSuccess;
  final GlobalKey<FormState> globalKey;
  @override
  Widget build(BuildContext context) {
    return CustomButtom(
        onPressed: () {
          if (!emailController.text.contains("@")) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email is not valid"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("password can't be empty"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }else if (globalKey.currentState!.validate()) {
            onSuccess();
          }
        },
        text: "Log in");
  }
}
