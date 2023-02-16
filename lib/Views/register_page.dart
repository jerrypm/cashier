import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cashier_mate/Utilities/string_constant.dart';
import 'package:cashier_mate/ViewModels/view_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cashier_mate/Views/home_page.dart';
import 'package:cashier_mate/Views/login_page.dart';

class RegisterPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>(); //key for form
  final RegisterViewModel registerViewModel = RegisterViewModel();
  String email = "";
  String password = "";
  String confirmPassword = "";

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
              Text(Texts.txtDescLogin(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  )),
              const SizedBox(height: 100.0),

              /*
                MARK: Section Form Field
                field Email
              */

              TextFormField(
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
                    /*

                         MARK: Cara ke 1

                    */
                    bool isDataOne =
                        await registerViewModel.register(email, password);

                    // langsung
                    if (isDataOne) {
                      debugPrint('$isDataOne oke');
                      // Button login
                      Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // error here
                      debugPrint('error login B');
                      // error message pada  texfield
                    }

                    /*

                         MARK: Cara ke 2

                    */
                    registerViewModel.onRegister(email, password, (isData) {
                      // menunggu data
                      if (isData) {
                        debugPrint('$isData what');
                        // Button login
                        Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        // error here
                        debugPrint('error login A');
                        // error message pada  texfield
                      }
                    });

                    /*

                         xxxxxxxxxx

                    */

                    // Save is_login
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool(Texts.isLoginKey(), true);
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
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          LoginPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Don\'t have an account? Sign up',
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
