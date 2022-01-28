import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/components/canteen_view.dart';
import 'package:hack/models/food.dart';
import 'package:hack/providers/canteen_provider.dart';
import 'package:provider/provider.dart';

class CanteenScreen extends StatelessWidget {
  CanteenScreen({Key? key}) : super(key: key);

  // final List items = [
  //   'Veg',
  //   'Non-Veg',
  // ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w600,
    );
    final data = Provider.of<CanteenProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Canteen",
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.056,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     DropdownButton(
                  //         items: items
                  //             .map((e) => DropdownMenuItem(
                  //                   child: Text(e),
                  //                   value: e,
                  //                 ))
                  //             .toList(),
                  //         onChanged: (dynamic object) {
                  //           debugPrint(object);
                  //         }),
                  //   ],
                  // )
                ],
              ),
            ),
            Consumer<CanteenProvider>(builder: (ctx, data, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Iterable<FoodModel> foodListCat = data.foodList
                      .where((element) => element.time == data.time);
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
                          hintText: '${data.getTotalPrice()}',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
      ),
    );
  }
}
