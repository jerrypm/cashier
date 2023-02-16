class Texts {
  //MARK: Default String
  static String titleApp() => 'Casier Mate';
  static String titleHome() => 'Home Page';
  static String welcomeMsg() => 'My app';

  //MARK: Button
  static String signIn() => 'Sign In';
  static String signUp() => 'Sign Up';

  //MARK: Login Page
  static String login() => 'Login';
  static String email() => 'Email';
  static String password() => 'Password';
  static String rePassword() => 'Confirm Password';
  static String valueEmail() => 'value email';
  static String valuePass() => 'value pass';
  static String valiEmail() => 'Please enter your email';
  static String valiPassword() => 'Please enter your password';
  static String txtTitleFirstLogin() => 'Welcome to';
  static String txtTitleSecLogin() => 'the Mobile POS Login!';
  static String txtTitleSecRegister() => 'the Mobile POS Register!';
  static String txtDescLogin() => 'Sign in to Access Your Mobile Point of Sale';

  //MARK: Keys
  static String isLoginKey() => 'isLogged';
  static String regEx() => r'^[a-z A-Z]+$';
  static String regExEmail() =>
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static String regExPass() => r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,}$';

  // Hardcoded login credentials
  static String emailLogin = 'admin@mail.com';
  static String passwordLogin = '12345678';
}
