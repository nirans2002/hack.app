// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/database/theme/colors.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

//
String imageUrl =
    "https://img.freepik.com/free-vector/music-event-poster-template-with-abstract-shapes_1361-1316.jpg?size=626&ext=jpg";
String eventName = "event name";
String date = "28/02/2022";

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Details'),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text(
              "Register Now",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Card(
              color: eventCardColor,
              elevation: 1,
              child: Center(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        eventName,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        details_list("Hosted by:", "Club 1"),
                        details_list("Venue:", "Club 1"),
                        details_list("Date:", "28/02/2022 - 28/02/2022"),
                        details_list("Time:", "10:00 AM"),
                        details_list("Registeration Fee:", "Rs. 100"),
                        details_list(
                            "Registration Link:", "https://www.google.com"),
                        details_list("Contact:", "9876543210"),
                      ],
                    )
                  ],
                ),
              )),
        )));
  }

  ListTile details_list(String title, value, {bool isLink = false}) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLink
            ? value
            : Text(
                value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
