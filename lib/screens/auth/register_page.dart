import 'package:flutter/material.dart';
import '../../../Utilities/string_constant.dart';
import '../../../view_models/auth_view_models.dart';
import '../../utilities/color_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>(); //key for form
  final RegisterViewModel registerViewModel = RegisterViewModel();
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();

  String name = Texts.empty();
  String email = Texts.empty();
  String password = Texts.empty();
  String confirmPassword = Texts.empty();
  bool obscureText = true;

  //MARK: Handle Hit API Login
  void handleSubmit(BuildContext context) {
    String name = nameText.text;
    String email = emailText.text;
    String pass = passText.text;
    registerViewModel.handleRegister(context, name, email, pass);
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
                const SizedBox(height: 80.0),
                Center(
                  child: Image.asset(
                    Texts.onBoardAuthIcon(),
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: Text(Texts.txtTitleSecRegister(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      )),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: Text(Texts.txtDescRegister(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      )),
                ),
                const SizedBox(height: 16.0),

                /*             
                   MARK: Section Form Field              
                  field name             
               */

                TextFormField(
                  controller: nameText,
                  decoration: InputDecoration(
                    labelText: Texts.name(),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryColor),
                    ),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  onSaved: (value) => name = value.toString(),
                ),
                TextFormField(
                  controller: emailText,
                  decoration: InputDecoration(
                    labelText: Texts.email(),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryColor),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return Texts.valiEmail();
                    }
                    return null;
                  },
                  onSaved: (value) => email = value.toString(),
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
                      borderSide: BorderSide(color: AppColors.secondaryColor),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      color: AppColors.secondaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Check if password is visible
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.secondaryColor,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Texts.valiPassword();
                    }
                    return null;
                  },
                  onSaved: (value) => password = value.toString(),
                  obscureText: obscureText,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: Texts.rePassword(),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryColor),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.secondaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Check if password is visible
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.secondaryColor,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Texts.valiPassword();
                    }
                    return null;
                  },
                  onSaved: (value) => password = value.toString(),
                  obscureText: obscureText,
                ),
                /*             
                   MARK: Section Button              
                */
                const SizedBox(height: 54.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      handleSubmit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(Texts.signUp()),
                  ),
                ),
                /*             
                   MARK: Section Action Sign In              
                */
                const SizedBox(height: 32.0),
                GestureDetector(
                  onTap: () {
                    debugPrint('test change login');
                    registerViewModel.navigationToLogin(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      Texts.txtSwitchLogin(),
                      style: const TextStyle(color: AppColors.secondaryColor),
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
