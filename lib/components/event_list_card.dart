import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack/database/theme/colors.dart';

Padding eventListCard({
  required String imageUrl,
  required String eventName,
  required String date,
  required String eventDetails,
  required tapEvent,
  required register,
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
          TextButton(onPressed: register, child: const Text("Register Now"))
        ],
      ),
      // isThreeLine: true,
      trailing:
          const Icon(Icons.info_outline_rounded, color: Colors.blue, size: 30),
      onTap: tapEvent,
    ),
  );
}
