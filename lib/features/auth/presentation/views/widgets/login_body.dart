import 'package:chat_app/features/auth/presentation/views/widgets/email_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_buttom.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_row.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_filed.dart';
import 'package:chat_app/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

bool isNotVisible = true;

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const LogoWidget(),
              const SizedBox(
                height: 20,
              ),
              const LoginTitle(
                text: 'Log in to your account',
              ),
              const SizedBox(
                height: 20,
              ),
              EmailFiled(emailController: emailController),
              const SizedBox(
                height: 20,
              ),
              PasswordFiled(
                  passwordController: passwordController,
                  isNotVisible: isNotVisible,
                  toggleVisibility: () {
                    setState(() {
                      isNotVisible = !isNotVisible;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              LoginButtom(
                  emailController: emailController,
                  passwordController: passwordController,
                  globalKey: globalKey,
                  onSuccess: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  ),
              const SizedBox(
                height: 20,
              ),
              const LoginRow(),
            ]),
          ),
        ),
      ),
    );
  }
}
