import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LostAndFound extends StatelessWidget {
  const LostAndFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/lostandfound');
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'My Lost Items',
              ),
              Tab(
                text: 'General',
              ),
            ],
          ),
          title: const Text('Lost and Found'),
        ),
        body: TabBarView(
          children: [GeneralLostItems(), MyLostItems()],
        ),
      ),
    );
  }
}

class GeneralLostItems extends StatelessWidget {
  const GeneralLostItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return LostCard();
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}

class MyLostItems extends StatelessWidget {
  const MyLostItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return LostCard();
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}

class LostCard extends StatelessWidget {
  LostCard({Key? key}) : super(key: key);
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
                ElevatedButton(onPressed: () {}, child: Text("Notify Me")),
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
