import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/mockdata/userFavEvent.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/database/theme/colors.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    Key? key,
    required this.event,
  }) : super(key: key);
  // final int indexdata;
  final Event event;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    // final List<Event> events = getEventData();
    bool isFav = checkFavEvent(widget.event.id);
    // bool isFav = false;

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
              launchURLBrowser(widget.event.registrationLink);
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
                      imageUrl: widget.event.eventImageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 1),
                          Text(
                            widget.event.eventName,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 1),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              child: isFav
                                  ? const Icon(Icons.favorite,
                                      color: Colors.pink)
                                  : const Icon(Icons.favorite_border_sharp),
                              onTap: () {
                                isFav
                                    ? userFavEventIdList.remove(widget.event.id)
                                    : userFavEventIdList.add(widget.event.id);
                                setState(() {
                                  // isFav = !isFav;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        details_list("Hosted by:", widget.event.host.hostName),
                        details_list("Venue:", widget.event.eventVenue),
                        details_list("Date:", "test"),
                        details_list("Date:",
                            "${widget.event.eventStartDate} - ${widget.event.eventEndDate}"),
                        details_list(
                            "Registeration Fee:", widget.event.registrationFee),
                        details_list(
                            "Registration Link:", widget.event.registrationLink,
                            isLink: true, url: widget.event.registrationLink),
                        details_list("Contact:",
                            "${widget.event.contact.contactName} : ${widget.event.contact.contactPhone}"),
                      ],
                    )
                  ],
                ),
              )),
        )));
  }

  // ignore: non_constant_identifier_names
  ListTile details_list(String title, value, {bool isLink = false, url}) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          onTap: isLink
              ? () {
                  launchURLBrowser(url);
                }
              : null,
        ),
      ),
    );
  }
}
