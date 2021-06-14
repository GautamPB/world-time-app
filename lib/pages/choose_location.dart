import 'package:flutter/material.dart';
import '../utils/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime('India', '../../assets/india_flag.png', 'Asia/Kolkata'),
    WorldTime('London', '../../assets/london_flag.png', 'Europe/London'),
    WorldTime('Athens', '../../assets/athens.png', 'Europe/Berlin'),
    WorldTime('Cairo', '../../assets/cairo_flag.png', 'Africa/Cairo'),
    WorldTime('Nairobi', '../../assets/nairobi_flag.png', 'Africa/Nairobi'),
    WorldTime('Chicago', '../../assets/chicago_flag.png', 'America/Chicago'),
    WorldTime('New York', '../../assets/usa_flag.jpg', 'America/New_York'),
    WorldTime('Seoul', '../../assets/south_korea_flag.jpg', 'Asia/Seoul'),
    WorldTime('Jakarta', '../../assets/indonesia_flag.jpg', 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homescreen with these new props
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          backgroundColor: Colors.blue[600],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(locations[index].flag),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
