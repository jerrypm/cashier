import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';
import '../models/transaction_model.dart';
import '../screens/order/payment_page.dart';
import '../utilities/local_storage.dart';
import '../views/payment/payment_success_page.dart';
import '../../view_models/main_view_models.dart';

class CartController extends GetxController {
  final LocalStorage _localStorage = LocalStorage();
  final MainViewModel orderViewModel = Get.put(MainViewModel());
  var transactionList = <Transaction>[].obs;

  //MARK: Init
  @override
  void onInit() {
    super.onInit();
    fetchTransaction();
  }

  Future<void> saveLastQueueNumber(int lastQueueNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastQueueNumber', lastQueueNumber);
  }

  Future<int> getLastQueueNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastQueueNumber') ?? 0;
  }

  Future<void> createTransaction(
    List<Order> data,
    double tax,
    double totalPrice,
    String? quantity,
  ) async {
    int lastQueueNumber = await getLastQueueNumber();
    int newQueueNumber = lastQueueNumber + 1;

    await saveLastQueueNumber(newQueueNumber);

    final transaction = Transaction(
      data: data,
      tax: tax,
      totalPrice: totalPrice,
      date: DateTime.now(),
      quantity: quantity,
      queueNumber: 'TRSC#00$newQueueNumber',
    );

    Get.to(
      PaymentPage(transactions: transaction),
    );
  }

  void processPayment(Transaction transaction, double cash, double change) {
    saveTransaction(transaction);
    Get.off(
      () => PaymentSuccessPage(
        totalItem: transaction.quantity ?? "",
        totalPaid: transaction.totalPrice,
        cash: cash,
        change: change,
        date: transaction.date.toString(),
        itemsNumber: transaction.queueNumber ?? "",
      ),
      transition: Transition.noTransition,
    );
  }

  /*
    MARK: Save local data share preference
  */

  void saveTransaction(Transaction transaction) async {
    transactionList.add(transaction);
    await _localStorage.saveTransaction(transaction);
    orderViewModel.deleteAllOrder();
    fetchTransaction();
  }

  /*
    MARK: Update local data share preference
  */

  @override
  void update([List<Object>? ids, bool condition = true]) {
    transactionList.refresh();
  }

  /*
    MARK: Load local data share preference
  */

  void fetchTransaction() async {
    transactionList.value = await _localStorage.getTransactions();
    update();
  }
}
