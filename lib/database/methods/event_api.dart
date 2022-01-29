import 'package:hack/database/mockdata/events_data_mock.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/screens/event_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';

List<Event> dataList = [];
final List data = event_mock_data;

getEventData() {
  // final data = jsonDecode(responseData.body);

  // print(data);
  for (Map<String, dynamic> i in data) {
    dataList.add(Event.fromJson(i));
  }
  isloading = false;
  return dataList;
}

// launchurl

launchURLBrowser(String url) async {
  if (!await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// fav event list

List userFavEventIdList = ["1", "4"];

//check fav event

bool checkFavEvent(eventId) {
  if (userFavEventIdList.contains(eventId)) {
    return true;
  } else {
    return false;
  }
}
