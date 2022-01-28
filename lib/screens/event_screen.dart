import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            eventListCard(),
            eventListCard(),
            eventListCard(),
          ],
        ),
      ),
    );
  }

  Padding eventListCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        tileColor: eventTileColor,
        leading: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
        ),
        title: Text(
          eventName,
          style: const TextStyle(color: eventTextColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Date : $date',
              style: const TextStyle(color: eventDesColor),
            ),
            Text(
              eventDetails,
              style: const TextStyle(color: eventDesColor),
            ),
          ],
        ),
        // isThreeLine: true,
        trailing: const Icon(Icons.info_outline_rounded,
            color: Colors.blue, size: 30),
        onTap: tapEvent,
      ),
    );
  }
}
