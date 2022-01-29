import 'package:flutter/material.dart';
import 'package:hack/components/event_list_card.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/mockdata/userFavEvent.dart';
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

bool isloading = true;
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
            : RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      eventList = getEventData();
                    });
                  });
                },
                child: list_event(),
              ),
      ),
    );
  }

  ListView list_event() {
    return ListView.builder(
      itemCount: eventList.length,
      itemBuilder: (BuildContext context, int index) {
        bool isFav = checkFavEvent(eventList[index].id);
        return eventListCard(
          eventId: eventList[index].id,
          imageUrl: eventList[index].eventImageUrl,
          date:
              "${eventList[index].eventStartDate} - ${eventList[index].eventEndDate}",
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
            launchURLBrowser(eventList[index].registrationLink);
          },
          favicon: GestureDetector(
            child: isFav
                ? const Icon(Icons.favorite, color: Colors.pink)
                : const Icon(Icons.favorite_border_sharp),
            onTap: () {
              isFav
                  ? userFavEventIdList.remove(eventList[index].id)
                  : userFavEventIdList.add(eventList[index].id);
              setState(() {
                isFav = !isFav;
              });
            },
          ),
        );
      },
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
