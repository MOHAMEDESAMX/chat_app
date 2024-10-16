import 'package:chat_app/core/shared_widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class SignupButtom extends StatelessWidget {
  const SignupButtom(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.onSuccess, required this.globalKey});

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final VoidCallback onSuccess;
  final GlobalKey<FormState> globalKey;
  @override
  Widget build(BuildContext context) {
    return CustomButtom(
        onPressed: () {
          if(globalKey.currentState!.validate()){
            onSuccess();
          }
          else if (nameController.text.length < 5) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Name is too short \n at least 5 letters"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (!emailController.text.contains('@')) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email is not valid"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (phoneController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Phone can't be empty"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (passwordController.text.length < 8) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    "Password is too short \n must be at least 8 characters"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        text: "sign up");
  }
}
