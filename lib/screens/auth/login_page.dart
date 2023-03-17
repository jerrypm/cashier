import 'dart:ffi';

import '../../utilities/color_custom.dart';
import 'package:flutter/material.dart';
import '../../../Utilities/string_constant.dart';
import '../../../view_models/auth_view_models.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({
    Key? key,
  }) : super(key: key);

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<loginScreen> {
  final formKey = GlobalKey<FormState>(); //key for form
  final LoginViewModel loginViewModel = LoginViewModel();
  final RegisterViewModel registerViewModel = RegisterViewModel();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();

  String email = Texts.empty();
  String password = Texts.empty();
  bool obscureText = true;

  //MARK: Handle Hit API Login
  void handleSubmit(BuildContext context) {
    String email = emailText.text;
    String pass = passText.text;
    loginViewModel.handleLogin(context, email, pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*            
                    MARK: Section Text tile              
                */
                const SizedBox(height: 100.0),
                Center(
                  child: Image.asset(
                    Texts.onBoardAuthIcon(),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: Text(Texts.txtTitleFirstLogin(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      )),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: Text(Texts.txtTitleSecLogin(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      )),
                ),
                const SizedBox(height: 16.0),

                /*             
                   MARK: Section Form Field                
                   field Email              
                  */
                TextFormField(
                  controller: emailText,
                  decoration: InputDecoration(
                    labelText: Texts.email(),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkBlue),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passText,
                  decoration: InputDecoration(
                    labelText: Texts.password(),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkBlue),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.darkBlue,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Check if password is visible
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.darkBlue,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  onSaved: (value) => password = value.toString(),
                  obscureText: obscureText,
                ),

                /*             
                   MARK: Forgot Password              
                */
                const SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Texts.forgotPass(),
                    textAlign: TextAlign.right,
                  ),
                ),

                /*             
                   MARK: Section Button             
                */
                const SizedBox(height: 44.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      handleSubmit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBlue,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(Texts.signIn()),
                  ),
                ),

                /*            
                    MARK: Section Action Sign up              
                */
                const SizedBox(height: 32.0),
                GestureDetector(
                  onTap: () {
                    loginViewModel.navigationToRegister(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      Texts.txtSwitchRegister(),
                      style: const TextStyle(color: AppColors.darkBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
