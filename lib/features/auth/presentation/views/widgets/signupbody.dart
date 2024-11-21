import 'package:chat_app/core/services/auth_services.dart';
import 'package:chat_app/core/services/firestore_services.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/name_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/phone_filed.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_row.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/signup_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

bool isNotVisible = true;

class _SignupBodyState extends State<SignupBody> {
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  text: 'Register To New Account',
                ),
                Gap(20.h),
                NameFiled(
                  nameController: nameController,
                ),
                Gap(15.h),
                EmailFiled(emailController: emailController),
                Gap(15.h),
                PhoneFiled(phoneController: phoneController),
                Gap(15.h),
                PasswordFiled(
                  passwordController: passwordController,
                  isNotVisible: isNotVisible,
                  toggleVisibility: () {
                    setState(() {
                      isNotVisible = !isNotVisible;
                    });
                  },
                ),
                Gap(20.h),
                SignupButtom(
                    passwordController: passwordController,
                    emailController: emailController,
                    nameController: nameController,
                    phoneController: phoneController,
                    globalKey: globalKey,
                    onSuccess: () async {
                      if (globalKey.currentState!.validate()) {
                        signupOperation(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields correctly."),
                            backgroundColor: Colors.orange,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    }),
                Gap(25.h),
                const RegisterRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

signupOperation(context) async {
  final auth = AuthServices();
  final addeduser = FirestoreServices();
  final user = await auth.createUserWithEmailAndPassword(
      emailController.text, passwordController.text, context);
  if (user != null) {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    addeduser.addUser(nameController.text, emailController.text, FirebaseAuth.instance.currentUser!.uid, "", phoneController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Email verification sent."),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginView(),
      ),
    );
  }
}
