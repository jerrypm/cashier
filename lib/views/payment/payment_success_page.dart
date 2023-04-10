// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // DateFormat
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:cashier_mate/utilities/string_constant.dart';

import '../../app/main_page.dart';
import '../../utilities/color_custom.dart';

class PaymentSuccessPage extends StatefulWidget {
  final String itemsNumber;
  final String date;
  final String totalItem;
  final double totalPaid;
  final double cash;
  final double change;

  const PaymentSuccessPage({
    Key? key,
    required this.itemsNumber,
    required this.date,
    required this.totalItem,
    required this.totalPaid,
    required this.cash,
    required this.change,
  }) : super(key: key);

  @override
  PaymentSuccessPageState createState() => PaymentSuccessPageState();
}

class PaymentSuccessPageState extends State<PaymentSuccessPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailText = TextEditingController();
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: Body
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: ScaleTransition(
                    scale: _animation!,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 193, 244, 223),
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 100,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF2DDD98),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              Texts.txtSuccess(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${widget.itemsNumber} | ${widget.date}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 44),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        Texts.txtTotalItem(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        ' ${widget.totalItem}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        Texts.txtTotalPaid(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${widget.totalPaid.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        Texts.txtCCash(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${widget.cash.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        Texts.txtChange(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${widget.change.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: emailText,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.secondaryColor.withOpacity(0.6),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondaryColor),
                  ),
                  border: const UnderlineInputBorder(),
                  hintText: Texts.txtInputEmail(),
                ),
              ),
            ),
            const SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailText.text.isNotEmpty) sendEmailWithPdf();
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return AppColors.secondaryColor.withOpacity(0.6);
                            },
                          ),
                        ),
                        child: Text(Texts.sendEmail()),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(
                            () => const MainPage(),
                            transition: Transition.topLevel,
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return AppColors.secondaryColor.withOpacity(0.6);
                            },
                          ),
                        ),
                        child: Text(Texts.newOrder()),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //MARK: - Create PDF File
  Future<File> createPdf() async {
    String formattedDate =
        DateFormat(Texts.dateFormat()).format(DateTime.now());
    final pdf = pw.Document();

    final titleStyle =
        pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold);
    const textStyle = pw.TextStyle(fontSize: 14);
    final separator = pw.Container(height: 1.0, color: PdfColors.grey300);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('${Texts.txtItemNum()} ${widget.itemsNumber}',
                  style: titleStyle), // change number transaction
              separator,
              pw.SizedBox(height: 10),
              pw.Text('Date: $formattedDate', style: textStyle),
              separator,
              pw.SizedBox(height: 8),
              pw.Row(children: [
                pw.Text('${Texts.txtTotalItem()} :', style: textStyle),
                pw.Spacer(),
                pw.Text('${widget.totalItem}', style: textStyle),
              ]),
              pw.SizedBox(height: 8),
              pw.Row(children: [
                pw.Text('${Texts.txtTotalPaid()} :', style: textStyle),
                pw.Spacer(),
                pw.Text('\$${widget.totalPaid}', style: textStyle),
              ]),
              pw.SizedBox(height: 8),
              pw.Row(children: [
                pw.Text('${Texts.txtCCash()} :', style: textStyle),
                pw.Spacer(),
                pw.Text('\$${widget.cash}', style: textStyle),
              ]),
              pw.SizedBox(height: 8),
              pw.Row(children: [
                pw.Text('${Texts.txtChange()} :', style: textStyle),
                pw.Spacer(),
                pw.Text('\$${widget.change}', style: textStyle),
              ]),
              separator,
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/invoice.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  //MARK: - Email send
  // - note: For use this code email you need real device
  Future<void> sendEmailWithPdf() async {
    File pdfFile = await createPdf();

    final Email email = Email(
      body: Texts.emailBody(),
      subject: Texts.emailSubject(),
      recipients: [emailText.text],
      attachmentPaths: [pdfFile.path],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      print(error);
    }
  }
}
