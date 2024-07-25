import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/core/app_managers/assets_managers.dart';
import 'package:my_flutter_app/core/enums/validation_type.dart';

import '../../../widgets/buttons.dart';
import '../../../widgets/input_fields.dart';
import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LoginLogic>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      AssetManager.appLogo,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Gap(12),
                  Text(
                    "Welcome to \n e-Commerce",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "version 1.0.0",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  Gap(64),
                  Text(
                    "Enter your credentials to login",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(16),
                  CostumeFormField(
                    validationType: ValidationType.email,
                    controller: logic.emailController,
                    hintText: "Enter your Email",
                    onChanged: (){
                      setState(() {

                      });
                    },
                    labelText: "Email",
                  ),
                  Gap(16),
                  CostumeFormField(
                    validationType: ValidationType.password,
                    controller: logic.passwordController,
                    hintText: "Enter your Password",
                    labelText: "Password",
                    onChanged: (){
                      setState(() {

                      });
                    },
                  ),
                  Gap(6),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                          onTap: () {
                            print("forget password clicked");
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                  Gap(64),
                  CostumeButtons.common(
                    labelText: 'Login',
                    onPressed: () {
                      logic.login();
                    },
                    isEnabled: logic.validateFields(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
