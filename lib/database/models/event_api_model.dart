import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  String id;
  String eventName;
  String eventDescription;
  String eventStartDate;
  String eventEndDate;
  String eventDays;
  String eventStartTime;
  String eventEndTime;
  String eventVenue;
  String registrationLink;
  String registrationFee;
  String eventImageUrl;
  Host host;
  ContactPerson contact;

  Event({
    required this.id,
    required this.eventDescription,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDays,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventVenue,
    required this.registrationLink,
    required this.registrationFee,
    required this.eventImageUrl,
    required this.host,
    required this.contact,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        eventDescription: json["description"],
        eventName: json["event_name"],
        eventStartDate: json["start_date"],
        eventEndDate: json["end_date"],
        eventDays: json["days"],
        eventStartTime: json["start_time"],
        eventEndTime: json["end_time"],
        eventVenue: json["venue"],
        registrationLink: json["registration_link"],
        registrationFee: json["registration_fee"],
        eventImageUrl: json["event_image_url"],
        host: Host.fromJson(json["host"]),
        contact: ContactPerson.fromJson(json["contact_person"]),
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
        "registration_link": registrationLink,
        "registration_fee": registrationFee,
        "event_image_url": eventImageUrl,
        "host": host.toJson(),
        "contact_person": contact.toJson(),
      };
}

class Host {
  String hostName;
  String hostWebsite;
  String hostEmail;

  Host({
    required this.hostName,
    required this.hostWebsite,
    required this.hostEmail,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        hostName: json["host_name"],
        hostWebsite: json["host_email"],
        hostEmail: json["host_website"],
      );

  Map<String, dynamic> toJson() => {
        "host_name": hostName,
        "host_email": hostWebsite,
        "host_website": hostEmail,
      };
}

class ContactPerson {
  String contactName;
  String contactEmail;
  String contactPhone;

  ContactPerson({
    required this.contactName,
    required this.contactEmail,
    required this.contactPhone,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
        contactName: json["contact_name"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
      );

  Map<String, dynamic> toJson() => {
        "contact_name": contactName,
        "contact_email": contactEmail,
        "contact_phone": contactPhone,
      };
}
