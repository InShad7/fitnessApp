import '/controller/controller.dart';

import '/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'widget/login_btn.dart';
import 'widget/main_card.dart';
import 'widget/text_field.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SignInText(),
                kHeight20,
                MyTextField(
                  title: 'Mobile Number',
                  icon: Icons.call,
                  myControler: phoneController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Number can\'t be empty';
                    }
                  },
                ),
                kHeight30,
                const LoginBtn(),
              ]),
        ),
      ),
    );
  }
}
