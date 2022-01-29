import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cleanliness extends StatelessWidget {
  const Cleanliness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/lostandfound');
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 16,
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Details',
                              style: GoogleFonts.poppins(fontSize: 32),
                            ),
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Please enter some value";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone number',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Please enter some value";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'What have you seen?',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Please enter some value";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Hand In",
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Report Now',
              ),
              Tab(
                text: 'General',
              ),
            ],
          ),
          title: const Text('Cleanliness'),
        ),
        body: TabBarView(
          children: [GeneralCleanliness(), Reporting()],
        ),
      ),
    );
  }
}

class GeneralCleanliness extends StatelessWidget {
  const GeneralCleanliness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return CleanCard();
            },
            itemCount: 5,
          )
        ],
      ),
    );
  }
}

class Reporting extends StatelessWidget {
  const Reporting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return CleanCard();
            },
            itemCount: 2,
          )
        ],
      ),
    );
  }
}

class CleanCard extends StatelessWidget {
  CleanCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Navneeth",
                  style: titleStyle,
                ),
                Row(
                  children: [
                    Text(
                      "Tuesday , 12:00 PM",
                      style: titleStyle,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Hand In",
                          style: titleStyle,
                        )),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
                "Lorem ipsum dolor sit amet. Non sint assumenda et architecto sint ut aspernatur rerum est quas asperiores. Ab impedit neque in doloribus facere sit voluptatum dolor qui culpa esse sint ipsa.  "),
            const Divider(),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Notify Now")),
                Spacer(),
                Text(
                  "Contact ",
                  style: titleStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "8921238239",
                  style: titleStyle,
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}

Widget _buildRow(String imageAsset, String name, double score) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 2, color: Colors.redAccent),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(imageAsset)),
            SizedBox(width: 12),
            Text(name),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[900],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text('$score'),
            ),
          ],
        ),
      ],
    ),
  );
}

// void pressAdd() {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//           elevation: 16,
//           child: Container(
//             child: ListView(
//               shrinkWrap: true,
//               children: <Widget>[
//                 SizedBox(height: 20),
//                 Center(child: Text('Leaderboard')),
//                 SizedBox(height: 20),
//                 _buildRow('assets/choc.png', 'Name 1', 1000),
//                 _buildRow('assets/choc.png', 'Name 2', 2000),
//                 _buildRow('assets/choc.png', 'Name 3', 3000),
//                 _buildRow('assets/choc.png', 'Name 4', 4000),
//                 _buildRow('assets/choc.png', 'Name 5', 5000),
//                 _buildRow('assets/choc.png', 'Name 6', 6000),
//               ],
//             ),
//           ),
//         );
//       });
// }
