import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: Style.textStyle20.copyWith(color: Colors.black)),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignupView()));
            },
            child: const Text(
              "Register here",
              style: Style.textStyle20,
            ))
      ],
    );
  }
}
