import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/components/event_list_card.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/database/theme/colors.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

//data
String imageUrl =
    "https://media.istockphoto.com/photos/large-group-of-business-people-in-convention-centre-picture-id1281724535?b=1&k=20&m=1281724535&s=170667a&w=0&h=RV0k68y2VPMDnP6QlW_7kErXhbLcqjYVgNmwc3kMMLo=";
String date = "01/02/2022";
String eventDetails = "event details";
String eventName = "Event name";
void tapEvent() {
  debugPrint("tap event go to details");
}

bool isloading = false;
List<Event> EventList = [];

class _EventListScreenState extends State<EventListScreen> {
  @override
  initState() {
    super.initState();
    isloading = true;
    getEventData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: EventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return eventListCard(
                    imageUrl: imageUrl,
                    date: date,
                    eventDetails: EventList[index].eventDescription,
                    eventName: EventList[index].eventName,
                    tapEvent: tapEvent,
                    register: () {
                      debugPrint("register");
                    },
                  );
                },
              ),
      ),
    );
  }
}
