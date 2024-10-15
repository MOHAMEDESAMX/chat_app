import 'package:chat_app/features/auth/presentation/views/widgets/email_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/name_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/phone_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_row.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/signup_bottom.dart';
import 'package:chat_app/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

GlobalKey<FormState> globalKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

bool isNotVisible = true;

class _SignupBodyState extends State<SignupBody> {
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
                text: 'Register To New Account',
              ),
              const SizedBox(
                height: 20,
              ),
              NameFiled(
                nameController: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              EmailFiled(emailController: emailController),
              const SizedBox(
                height: 20,
              ),
              PhoneFiled(phoneController: phoneController),
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
              SignupButtom(
                passwordController: passwordController,
                emailController: emailController,
                nameController: nameController,
                phoneController: phoneController,
                onSuccess: () {
                  if (globalKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const RegisterRow(),
            ]),
          ),
        ),
      ),
    );
  }
}
