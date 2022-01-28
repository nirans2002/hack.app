import 'dart:convert';

import 'package:hack/database/mockdata/events_data_mock.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/screens/event_list_screen.dart';

List<Event> dataList = [];
final List data = [
  {
    "id": "1",
    "event_name": "Event 1",
    "description": "Description 1",
    "start_date": "2019-01-01",
    "end_date": "2019-01-01",
    "days": "1",
    "start_time": "10:00",
    "end_time": "11:00",
    "venue": "Location 1",
    "created_at": "2019-01-01",
    "updated_at": "2019-01-01",
    "is_free_event": "false",
    "registration_fee": "100",
    "regstration_link": "https://www.google.com",
    "category": "Category 1",
    "event_image_url":
        "https://media.istockphoto.com/photos/large-group-of-business-people-in-convention-centre-picture-id1281724535?b=1&k=20&m=1281724535&s=170667a&w=0&h=RV0k68y2VPMDnP6QlW_7kErXhbLcqjYVgNmwc3kMMLo=",
    "event_website": "https://www.google.com",
    "host": {
      "host_name": "club 1",
      "host_email": "example@club.com",
      "host_website": "www.club1.com",
    },
    "contact_person": {
      "contact_name": "contact 1",
      "contact_email": "example@gmail.com",
      "contact_phone": "1234567890",
    },
  },
  {
    "id": "1",
    "event_name": "Event 1",
    "description": "Description 1",
    "start_date": "2019-01-01",
    "end_date": "2019-01-01",
    "days": "1",
    "start_time": "10:00",
    "end_time": "11:00",
    "venue": "Location 1",
    "created_at": "2019-01-01",
    "updated_at": "2019-01-01",
    "is_free_event": "false",
    "registration_fee": "100",
    "regstration_link": "https://www.google.com",
    "category": "Category 1",
    "event_image_url":
        "https://media.istockphoto.com/photos/large-group-of-business-people-in-convention-centre-picture-id1281724535?b=1&k=20&m=1281724535&s=170667a&w=0&h=RV0k68y2VPMDnP6QlW_7kErXhbLcqjYVgNmwc3kMMLo=",
    "event_website": "https://www.google.com",
    "host": {
      "host_name": "club 1",
      "host_email": "example@club.com",
      "host_website": "www.club1.com",
    },
    "contact_person": {
      "contact_name": "contact 1",
      "contact_email": "example@gmail.com",
      "contact_phone": "1234567890",
    },
  },
];

getEventData() {
  // final data = jsonDecode(responseData.body);

  // print(data);
  for (Map<String, dynamic> i in data) {
    dataList.add(Event.fromJson(i));
  }
  EventList = dataList;
   isloading = false;
}
