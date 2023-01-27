import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class chooselocation extends StatefulWidget {
  const chooselocation({Key? key}) : super(key: key);

  @override
  State<chooselocation> createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {

  List<WorldTime> locations=[
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'uk.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'uk.png', url: 'Africa/Cairo')
  ];
 void updateTime (index) async{
   WorldTime instance =locations[index];
   await instance.getTime();
   // navigate to home screen and pass all data into home screen ,pop the screen
   Navigator.pop(context,{
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDaytime':instance.isDaytime,
   });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200] ,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assests/${locations[index].flag}'),
              ),
            ),
          );
        }

      ),
    );
  }
}

