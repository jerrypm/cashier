class Texts {
  //MARK: Default String
  static String titleApp() => 'Cashier Mate';
  static String titleAppHome() => 'Cashier';
  static String titleMenu() => 'Menu';

  static String titleHome() => 'Home';
  static String titleHistory() => 'History';
  static String titleOrders() => 'Orders';
  static String titleSettings() => 'Settings';
  static String titleItem() => 'Add Item';
  static String titlePayment() => 'Payment';
  static String titleSetting() => 'Settings';
  static String titleWeb() => 'Web';
  static String titleHistoryDetail() => 'History Details';
  static String welcomeMsg() => 'Cashier app';

  //MARK: Button
  static String signIn() => 'Sign In';
  static String signUp() => 'Sign Up';
  static String sendEmail() => 'Send Email';
  static String newOrder() => 'Place New Order';
  static String cancel() => 'Cancel';
  static String delete() => 'Delete';
  static String logout() => 'Logout';
  static String no() => 'No';
  static String yes() => 'Yes';
  static String close() => 'Close';

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
  static String placeholderList() => 'assets/images/undraw_no_data_.png';
  static String placeholderHome() => 'assets/images/error_404.png';

  static String minusIcon() => 'assets/icons/minus-circle.png';
  static String plusIcon() => 'assets/icons/plus-circle.png';

  //MARK: Keys
  static String isLoginKey() => 'isLogged';
  static String isGrid() => 'isGrid';
  static String regEx() => r'^[a-z A-Z]+$';
  static String regExEmail() =>
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static String regExPass() => r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,}$';
  static String dateFormat() => 'dd MMM yyyy';
  static String dateFormatTime() => "jm";

  //MARK: URL
  static String baseUrl() => 'http://restapi.adequateshop.com/api/';
  static String baseUrlGit() => 'https://gist.githubusercontent.com/jerrypm/';
  static String baseUrlLocal() => 'http://0.0.0.0:3003/'; // Local Mockoon
  static String urlComentor() => 'https://comentor.id/';
  static String urlFAQ() =>
      'https://docs.google.com/document/d/1ihaiwjo8JKPfp7fbhaknDTrlOMoIcCL9Mo9oK0aASvY/view';

  // Hardcoded login credentials
  static String emailLogin = 'admin@mail.com';
  static String passwordLogin = '12345678';

  //MARK: Alert
  static String titleMsgDelete() => 'Delete this item?';
  static String descMsgDelete() => 'Are you sure you want to delete this item?';
  static String descMsgLogOut() => 'Are you sure you want to Logout?';

  static String emailBody() =>
      'Attached are your transaction details in PDF format.';
  static String emailSubject() => 'Transaction';

  //MARK: Other
  static String txtSearch() => 'Search...';
  static String txtQuantity() => 'Quantity';
  static String txtNote() => 'Note';
  static String txtCart() => 'Add to Cart';
  static String txtIngredients() => 'Ingredients:';
  static String txtOrderNow() => 'Order Now';

  static String txtOrder() => 'Order Summary';
  static String txtSubTot() => 'Sub Total';
  static String txtTax() => 'Tax(10%)';
  static String txtTotal() => 'Total';
  static String txtPayment() => 'Process Payment';

  static String txtSuccess() => 'Success';
  static String txtTotalItem() => 'Total Items : ';
  static String txtTotalPaid() => 'Total Paid : ';
  static String txtCCash() => 'Customer Cash : ';
  static String txtChange() => 'Change : ';
  static String txtInputEmail() => 'Enter your email';
  static String txtItemNum() => 'Item number :';

  static String txtVersion() => 'Version';
  static String txtVersionValue() => '1.0.0';
  static String txtPrivacy() => 'FAQ';
  static String txtWeb() => 'Website';

  static String txtTotalHistory() => 'Total :';
  static String txtItems() => 'List of Items ';
}
