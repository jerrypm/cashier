import 'package:flutter/material.dart';
import '../../../Utilities/string_constant.dart';
import '../../../view_models/auth_view_models.dart';

class RegisterPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>(); //key for form
  final RegisterViewModel registerViewModel = RegisterViewModel();
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();

  String name = Texts.empty();
  String email = Texts.empty();
  String password = Texts.empty();
  String confirmPassword = Texts.empty();

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
              Text(Texts.txtTitleSecRegister(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 8.0),
              Text(Texts.txtDescRegister(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 80.0),

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
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade500),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return Texts.valiEmail();
                  }

                  return null;
                },
                onSaved: (value) => name = value.toString(),
              ),

              //MARK: Email
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
                validator: (value) {
                  if (value == null) {
                    return Texts.valiEmail();
                  }

                  return null;
                },
                onSaved: (value) => email = value.toString(),
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

              const SizedBox(height: 16.0),

              //MARK: field Re-Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: Texts.rePassword(),
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
                    backgroundColor: Colors.purple.shade900,
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
                  registerViewModel.navigationToLogin(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    Texts.txtSwitchLogin(),
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
