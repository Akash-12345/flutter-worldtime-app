import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
 late String location; //location name for the ui
  late String time; //time of the location
  late String flag; //url to assest flag icon
  late String url; //lcation url for api endpoint
 late bool isDaytime ;

  WorldTime({required this.location,required this.flag,required this.url});

 Future<void> getTime() async{
   try{
     var url1 = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
     Response response =await get(url1);
     Map data=jsonDecode(response.body);
     // print(data);
     //get properties from data
     String datetime=data['datetime'];
     String offset=data['utc_offset'].substring(1,3);
     //print(datetime);
     //print(offset);

     //create DateTime object
     DateTime now =DateTime.parse(datetime);
     now=now.add(Duration(hours: int.parse(offset)));

     isDaytime = now.hour >6 && now.hour <20 ? true :false;
     time = DateFormat.jm().format(now);// set the time property
   }
   catch (e){
     print("caught error : $e");
     print('could not get time data');
   }


  }

}




