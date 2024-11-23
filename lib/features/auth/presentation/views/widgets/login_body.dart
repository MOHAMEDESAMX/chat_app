import 'package:chat_app/core/services/auth_services.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/forget_password_view.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_buttom.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_row.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_filed.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

bool isNotVisible = true;
bool isloading = false;

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginBodyState extends State<LoginBody> {
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: ColorsApp.primaryColor,
              size: 60.r,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(
                key: globalKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      const LoginTitle(
                        text: 'Log in to your account',
                      ),
                      Gap(20.h),
                      EmailFiled(emailController: emailController),
                      Gap(15.h),
                      PasswordFiled(
                          passwordController: passwordController,
                          isNotVisible: isNotVisible,
                          toggleVisibility: () {
                            setState(() {
                              isNotVisible = !isNotVisible;
                            });
                          }),
                      Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              'Forgot Password?',
                              style: Style.textStylerow14,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgetPasswordView(
                                  emailController: emailController,
                                ),
                              ));
                            },
                          )),
                      Gap(20.h),
                      LoginButtom(
                        emailController: emailController,
                        passwordController: passwordController,
                        globalKey: globalKey,
                        onSuccess: () async {
                          if (globalKey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            await loginOperation(context);
                            isloading = false;
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please fill all fields correctly."),
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                      ),
                      Gap(25.h),
                      const LoginRow(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

Future<void> loginOperation(context) async {
  final auth = AuthServices();

  if (!isValidEmail(emailController.text)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter a valid email address."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
    return;
  }

  final user = await auth.signInWithEmailAndPassword(
      emailController.text, passwordController.text, context);
  FirebaseAuth.instance.currentUser!.sendEmailVerification();
  if (user != null) {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Please verify your email. A verification email has been sent."),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logged in successfully!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text("Login failed. Please check your credentials and try again."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}

bool isValidEmail(String email) {
  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  return emailRegExp.hasMatch(email);
}
