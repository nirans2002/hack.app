import 'package:hack/database/mockdata/events_data_mock.dart';
import 'package:hack/database/models/event_api_model.dart';
import 'package:hack/screens/event_list_screen.dart';

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