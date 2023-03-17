class Texts {
  //MARK: Default String
  static String titleApp() => 'Cashier Mate';
  static String titleAppHome() => 'Cashier';
  static String titleMenu() => 'Menu';

  static String titleHome() => 'Home';
  static String titleHistory() => 'History';
  static String titleOrders() => 'Orders';
  static String titleSettings() => 'Settings';
  static String welcomeMsg() => 'Cashier app';

  //MARK: Button
  static String signIn() => 'Sign In';
  static String signUp() => 'Sign Up';

  //MARK: Login Page
  static String empty() => '';
  static String login() => 'Login';
  static String name() => 'Name';
  static String email() => 'Email';
  static String password() => 'Password';
  static String rePassword() => 'Confirm Password';
  static String forgotPass() => 'Forgot Password';
  static String valueEmail() => 'value email';
  static String valuePass() => 'value pass';
  static String valiEmail() => 'Please enter your email';
  static String valiPassword() => 'Please enter your password';
  static String txtTitleFirstLogin() => 'Welcome Back';
  static String txtTitleSecLogin() => 'Boost sales with our efficient POS app.';
  static String txtTitleSecRegister() => 'Get On Board!';
  static String txtDescRegister() =>
      'Sign Up to access your mobile Point of Sale';
  static String txtSwitchRegister() => 'Don\'t have an account? Sign up';
  static String txtSwitchLogin() => 'I already have an account? Sign In';

  //MARK: Image Assets
  static String onBoardAuthIcon() => 'assets/icons/onboarding.png';
  static String homeIcon() => 'assets/icons/home.png';
  static String historyIcon() => 'assets/icons/history.png';
  static String orderIcon() => 'assets/icons/orders.png';
  static String settingIcon() => 'assets/icons/settings.png';
  static String iconTopHome() => 'assets/icons/topIcon.png';

  //MARK: Keys
  static String isLoginKey() => 'isLogged';
  static String isGrid() => 'isGrid';
  static String regEx() => r'^[a-z A-Z]+$';
  static String regExEmail() =>
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static String regExPass() => r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,}$';

  //MARK: URL
  static String baseUrl() => 'http://restapi.adequateshop.com/api/';

  static String baseUrlLocal() => 'http://0.0.0.0:3003/';

  // Hardcoded login credentials
  static String emailLogin = 'admin@mail.com';
  static String passwordLogin = '12345678';

  //MARK: Other
  static String txtSearch() => 'Search...';
}
