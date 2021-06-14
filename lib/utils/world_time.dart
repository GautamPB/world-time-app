import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String time = '';
  String location = '';
  String flag = '';
  String url = '';

  bool isDayTime = true;

  WorldTime(location, flag, url) {
    this.location = location;
    this.flag = flag;
    this.url = url;
  }

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = json.decode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(datetime);
      String hours = offset.substring(1, 3);
      String minutes = offset.substring(4);
      now = now
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Uncaught time error');
      time = 'Could not get time';
    }
  }
}
