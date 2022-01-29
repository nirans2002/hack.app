// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hack/database/models/event_api_model.dart';
// import 'package:hack/database/theme/colors.dart';
// import 'package:hack/screens/event_list_screen.dart';

// class EventScreen extends StatelessWidget {
//   EventScreen({Key? key, required this.eventIndex}) : super(key: key);
//   final int eventIndex;
  
//   @override
  
//   Widget build(BuildContext context) {
//   final Event event = eventList[eventIndex];

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Event Details'),
//           centerTitle: true,
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextButton(
//             child: const Text(
//               "Register Now",
//               style: TextStyle(color: Colors.blue, fontSize: 20),
//             ),
//             onPressed: () {
//               //TODO: add call fn
//             },
//           ),
//         ),
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Card(
//               color: eventCardColor,
//               elevation: 1,
//               child: Center(
//                 child: Column(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: event.eventImageUrl,
//                       progressIndicatorBuilder:
//                           (context, url, downloadProgress) =>
//                               CircularProgressIndicator(
//                                   value: downloadProgress.progress),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         event.eventName,
//                         style: const TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         details_list("Hosted by:", "Club 1"),
//                         details_list("Venue:", event.eventVenue),
//                         details_list("Date:", {
//                           event.eventStartDate + ' - ' + event.eventEndDate
//                         }),
//                         details_list("Time:", {event.eventStartTime}),
//                         details_list(
//                             "Registeration Fee:", event.registrationFee),
//                         details_list(
//                             "Registration Link:", "https://www.example"),
//                         details_list("Contact:", "9876543210"),
//                       ],
//                     )
//                   ],
//                 ),
//               )),
//         )));
//   }

//   ListTile details_list(String title, value, {bool isLink = false}) {
//     return ListTile(
//       title: Text(title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       subtitle: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: isLink
//             ? value
//             : Text(
//                 value,
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//       ),
//     );
//   }
// }
