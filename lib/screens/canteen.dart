import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:hack/components/canteen_view.dart';
import 'package:hack/models/food.dart';
import 'package:hack/providers/canteen_provider.dart';
import 'package:provider/provider.dart';

class CanteenScreen extends StatefulWidget {
  const CanteenScreen({Key? key}) : super(key: key);

  @override
  State<CanteenScreen> createState() => _CanteenScreenState();
}

class _CanteenScreenState extends State<CanteenScreen> {
  // final List items = [
  late var _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w600,
    );
    final data = Provider.of<CanteenProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/online_store.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        data.notifyTime("breakfast");
                      },
                      child: Text("Breakfast", style: titleStyle),
                    ),
                    TextButton(
                      onPressed: () {
                        data.notifyTime("lunch");
                      },
                      child: Text(
                        "Lunch",
                        style: titleStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        data.notifyTime("tea");
                      },
                      child: Text(
                        "Tea",
                        style: titleStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<CanteenProvider>(builder: (ctx, data, child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                Iterable<FoodModel> foodListCat =
                    data.foodList.where((element) => element.time == data.time);
                return CanteenCard(
                  name: foodListCat.elementAt(i).name,
                  imageUrl: foodListCat.elementAt(i).imageUrl,
                );
              },
              itemCount: data.foodList
                  .where((element) => element.time == data.time)
                  .length,
            );
          }),
          Consumer<CanteenProvider>(builder: (context, data, child) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Rs : ${data.getTotalPrice()}',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int total = data.getTotalPrice();
                      var options = {
                        'key': "rzp_test_34L52B8zhFAGp7",
                        'amount': total * 100,
                        'name': 'CANTEEN PAYMENT',
                        'description': 'Demo',
                        'timeout': 300, // in seconds
                        'prefill': {
                          'contact': '8921238239',
                          'email': 'navneeth0112@gmail.com'
                        }
                      };
                      _razorpay.open(options);
                    },
                    child: Text(
                      "CheckOut",
                      style: titleStyle,
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
