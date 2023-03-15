import 'package:flutter/material.dart';
import '../../../Utilities/string_constant.dart';
import '../../../view_models/auth_view_models.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>(); //key for form
  final LoginViewModel loginViewModel = LoginViewModel();
  final RegisterViewModel registerViewModel = RegisterViewModel();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();
  String email = Texts.empty();
  String password = Texts.empty();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*
                MARK: Section Text tile
              */
              const SizedBox(height: 100.0),
              Text(Texts.txtTitleFirstLogin(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 8.0),
              Text(Texts.txtTitleSecLogin(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 8.0),
              Text(Texts.txtDescLogin(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 80.0),

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
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade500),
                  ),
                  // floatingLabelStyle: TextStyle(color: Colors.purple.shade500),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Invalid Email Format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              //MARK: field Password
              TextFormField(
                controller: passText,
                decoration: InputDecoration(
                  labelText: Texts.password(),
                  labelStyle: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade500),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return Texts.valiPassword();
                  }
                  return null;
                },
                onSaved: (value) => password = value.toString(),
                obscureText: true,
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
              const SizedBox(height: 54.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    //call function
                    handleSubmit(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
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
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
