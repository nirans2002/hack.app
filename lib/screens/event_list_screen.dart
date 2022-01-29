import 'package:flutter/material.dart';
import 'package:hack/components/event_list_card.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/screens/event_screen.dart';

//
tapEvent(context, int index) {
  debugPrint("tapEvent");
}

//
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

bool isloading = false;
List<Event> eventList = [];

class _EventListScreenState extends State<EventListScreen> {
  @override
  initState() {
    super.initState();
    isloading = true;
    eventList = getEventData();

    isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: eventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return eventListCard(
                    imageUrl: imageUrl,
                    date: date,
                    eventDetails: eventList[index].eventDescription,
                    eventName: eventList[index].eventName,
                  
                    tapEvent: () {
                      debugPrint("tap $index ");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventScreen(
                            event: eventList[index],
                          ),
                        ),
                      );
                    },
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
