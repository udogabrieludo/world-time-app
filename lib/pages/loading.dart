import 'package:flutter/material.dart';
import 'package:myfirstapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

//String time = 'Loading...';

void setUpTime() async {
   WorldTime instance = WorldTime(location:'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos');
    await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime': instance.isDayTime,

   });
}

 



 
  @override
  void initState() {
    
    super.initState();
    this.setUpTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitChasingDots(
        color: Colors.white,
        size: 70.0,
      ),
      )
    );
  }
}