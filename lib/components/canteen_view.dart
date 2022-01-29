import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/providers/canteen_provider.dart';
import 'package:provider/provider.dart';

class CanteenCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  CanteenCard({
    required this.name,
    required this.imageUrl,
  });

  @override
  State<CanteenCard> createState() => _CanteenCardState();
}

class _CanteenCardState extends State<CanteenCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final data = Provider.of<CanteenProvider>(context, listen: false);

    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w600,
    );
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.imageUrl),
                  radius: size.width * 0.072,
                ),
              ),
              Text(widget.name, style: titleStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                        data.updateQuantity(widget.name, quantity);
                      });
                    },
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        quantity--;
                        data.updateQuantity(widget.name, quantity);
                      });
                    },
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
