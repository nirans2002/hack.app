import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/components/event_list_card.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/mockdata/userFavEvent.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/database/theme/colors.dart';
import 'package:hack/screens/event_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

bool isloading = false;
List<Event> eventList = [];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 2;
    return Column(
      children: [
        Container(
          // color: eventCardColor,
          child: const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Today's Events",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/free-vector/modern-music-event-poster-template_1361-1292.jpg?size=626&ext=jpg',
            ),
          ),
        ),
        const Icon(
          Icons.more_horiz,
          size: 40,
          color: Colors.grey,
        ),
        Expanded(
          child: grid(itemWidth, itemHeight, context),
        )
      ],
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




// InkWell(
//               splashColor: Colors.blue[100],
//               onTap: () {
//                 Navigator.pushNamed(context, '/events');
//               },
//               child: SizedBox(
//                 height: itemHeight * 3,
//                 width: itemWidth * 2,
//                 child: const Text("Good Morning ",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
//               ),
//             )

// itemBuilder: (BuildContext context, int index) {
//                 bool isFav = checkFavEvent(favEventList[index].id);
//                 return eventListCard(
//                   eventId: favEventList[index].id,
//                   imageUrl: favEventList[index].eventImageUrl,
//                   date:
//                       "${favEventList[index].eventStartDate} - ${favEventList[index].eventEndDate}",
//                   eventDetails: favEventList[index].eventDescription,
//                   eventName: favEventList[index].eventName,
//                   tapEvent: () {
//                     debugPrint("tap $index ");
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EventScreen(
//                           event: favEventList[index],
//                         ),
//                       ),
//                     );
//                   },
//                   register: () {
//                     launchURLBrowser(favEventList[index].registrationLink);
//                   },
//                   favicon: GestureDetector(
//                     child: isFav
//                         ? const Icon(Icons.favorite, color: Colors.pink)
//                         : const Icon(Icons.favorite_border_sharp),
//                     onTap: () {
//                       isFav
//                           ? userFavEventIdList.remove(favEventList[index].id)
//                           : userFavEventIdList.add(favEventList[index].id);
                     
//                     },
//                   ),
//                 );
//               }