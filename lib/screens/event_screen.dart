import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/database/theme/colors.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({
    Key? key,
    required this.event,
  }) : super(key: key);
  // final int indexdata;
  final Event event;

  @override
  Widget build(BuildContext context) {
    // final List<Event> events = getEventData();

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
            onPressed: () {
              //TODO: add call fn to register
              launchURLBrowser(event.registrationLink);
            },
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
                      imageUrl: event.eventImageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        event.eventName,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        Text(event.registrationLink.toString()),
                        details_list("Hosted by:", event.host.hostName),
                        details_list("Venue:", event.eventVenue),
                        details_list("Date:", "test"),
                        details_list("Date:",
                            "${event.eventStartDate} - ${event.eventEndDate}"),
                        details_list(
                            "Registeration Fee:", event.registrationFee),
                        details_list(
                            "Registration Link:", event.registrationLink),
                        details_list("Contact:",
                            "${event.contact.contactName} : ${event.contact.contactPhone}"),
                      ],
                    )
                  ],
                ),
              )),
        )));
  }

  // ignore: non_constant_identifier_names
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
