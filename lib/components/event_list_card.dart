import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/database/methods/event_api.dart';
import 'package:hack/database/theme/colors.dart';
import 'package:hack/screens/event_list_screen.dart';

Padding eventListCard({
  required String imageUrl,
  required String eventName,
  required String date,
  required String eventDetails,
  required tapEvent,
  required register,
  required String eventId,
  required favicon,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      tileColor: eventTileColor,
      leading: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
      ),
      title: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          eventName,
          style: const TextStyle(color: eventTextColor, fontSize: 20),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'Date : $date',
              style: const TextStyle(color: eventDesColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              eventDetails,
              style: const TextStyle(color: eventDesColor),
            ),
          ),
          TextButton(onPressed: register, child: const Text("Register Now"))
        ],
      ),
      // isThreeLine: true,
      trailing: Column(
        children: [
          const Icon(Icons.info_outline_rounded, color: Colors.blue, size: 30),
          const Spacer(flex: 1),
          favicon,
        ],
      ),
      onTap: tapEvent,
    ),
  );
}
