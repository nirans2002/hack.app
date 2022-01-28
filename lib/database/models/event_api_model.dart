import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  // String id;
  String eventName;
  String eventDescription;
  String eventStartDate;
  String eventEndDate;
  String eventDays;
  String eventStartTime;
  String eventEndTime;
  String eventVenue;
  // String registrationLink;
  String registrationFee;
  String eventImageUrl;
  // Host host;

  Event({
    // required this.id,
    required this.eventDescription,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDays,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventVenue,
    // required this.registrationLink,
    required this.registrationFee,
    required this.eventImageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        // required this.id,
        eventDescription: json["description"],
        eventName: json["event_name"],
        eventStartDate: json["start_date"],
        eventEndDate: json["end_date"],
        eventDays: json["days"],
        eventStartTime: json["start_time"],
        eventEndTime: json["end_time"],
        eventVenue: json["venue"],
        // registrationLink: json["registration_link"],
        registrationFee: json["registration_fee"],
        eventImageUrl: json["event_image_url"],
        // host: Host.fromJson(json["host"]),
      );

  Map<String, dynamic> toJson() => {
        "event_description": eventDescription,
        "event_name": eventName,
        "start_date": eventStartDate,
        "end_date": eventEndDate,
        "days": eventDays,
        "start_time": eventStartTime,
        "end_time": eventEndTime,
        "venue": eventVenue,
        // "registration_link": registrationLink,
        "registration_fee": registrationFee,
        "event_image_url": eventImageUrl,
        // "host": host.toJson(),
      };
}
