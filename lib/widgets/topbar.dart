
import 'package:dc/Pages/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 30,right: 10,top: height*0.018,bottom: 10),
      
        width: width*0.95,
        height: height*0.15,
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
        
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello! Ram",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(height: 7,),
                Text("Bangalore",style: TextStyle(color: Colors.white60,fontSize: 12),),
                SizedBox(height: 5,),
                Text("DCB 0121232286",style: TextStyle(color: Colors.white60,fontSize: 12),)

              ],),
            Spacer(),
            Column(
              children: [
                topButton(Icons.notifications_none_outlined),
                SizedBox(height: 10,),
                topButton(Icons.power_settings_new_rounded),

              ],
            )
          ],
        )
    );
  }

}