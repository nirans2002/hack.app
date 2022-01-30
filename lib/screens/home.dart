
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Card(
              child: InkWell(
                splashColor: Colors.blue[100],
                onTap: () {
                  Navigator.pushNamed(context, '/events');
                },
                child: SizedBox(
                  height: itemHeight * 3,
                  width: itemWidth * 2,
                  child: const Text("Good Morning ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              ),
              color: Colors.blue[0],
            ),
          ),
          Expanded(
            child: grid(itemWidth, itemHeight, context),
          )
        ],
      ),
    );
  }

  GridView grid(double itemWidth, double itemHeight, BuildContext context) {
    return GridView.count(
      primary: false,
      childAspectRatio: (itemWidth / itemHeight),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: [
        Card(
          child: InkWell(
            splashColor: Colors.blue[100],
            onTap: () {
              Navigator.pushNamed(context, '/canteen');
            },
            child: const Center(
              child: Text("Canteen",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          color: Colors.blue[300],
        ),
        Card(
          child: InkWell(
            splashColor: Colors.blue[100],
            onTap: () {
              Navigator.pushNamed(context, '/events');
            },
            child: const Center(
              child: Text("Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          color: Colors.blue[300],
        ),
        Card(
          child: InkWell(
            splashColor: Colors.blue[100],
            onTap: () {
              Navigator.pushNamed(context, '/cleanliness');
            },
            child: const Center(
              child: Text("Cleanliness",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          color: Colors.blue[300],
        ),
        Card(
          child: InkWell(
            splashColor: Colors.blue[100],
            onTap: () {
              Navigator.pushNamed(context, '/lostandfound');
            },
            child: const Center(
              child: Text("Lost and Found",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          color: Colors.blue[300],
        ),
      ],
    );
  }
}

