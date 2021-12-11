import 'package:dc/Pages/payment.dart';
import 'package:dc/widgets/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Stack(children:[Column(
        children: [
              TopBar(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dashboard",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 16,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.white60,blurRadius: 20)]),)
                ],
              ),
              SizedBox(height: 20,),

              // Dashboard Tabs
              Padding(
                padding:  EdgeInsets.only(left:width*0.08,right: width*0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DasboardTabs(height,width,"My profile","assets/icons/id-card.png",(){}),
                        Spacer(),
                        DasboardTabs(height,width,"Project Details","assets/icons/projection.png",(){}),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        DasboardTabs(height,width,"Project tracker","assets/icons/briefing.png",(){}),
                        Spacer(),
                        DasboardTabs(height,width,"Payment tracker","assets/icons/online-payment.png",(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentTracker()));
                        }),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        DasboardTabs(height,width,"Project Document","assets/icons/document.png",(){}),
                        Spacer(),
                        DasboardTabs(height,width,"Team Assigned","assets/icons/development.png",(){}),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
             
        ],
      ),
      //Bottom Navigation part
      Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: width*0.5,
                    height:height*0.06,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(35)
                    ),
                    child: Container(
                        margin: EdgeInsets.only(left: 2,top: 0.2,bottom: 0.2),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(35)
                        ),

                    ) ,
                  )
                ],
              )
               ],
             )
      ])
    ),
  );
  }


  // Tabs Cards
  Widget DasboardTabs(double h,double w,String? tabname,String? img,VoidCallback? press) {
    
    return InkWell(
      onTap: press,
      child: Container(
                height: h*0.17,
                width: w*0.37,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$tabname",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold,)),
                    SizedBox(height: h*0.02,),
                    Image.asset("$img",color: Colors.deepOrange,height: h*0.05,width: 50,)

                  ],
                ),
              ),
    );
  }



}

//Top Circular Buttons
CircleAvatar topButton(IconData? icn) {
  return CircleAvatar(
    radius: 16,
    backgroundColor: Colors.deepOrange,
    child: Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
      ),
      child: Center(
        child: Icon(icn,color: Colors.deepOrange,size: 16,),
      ),
    ),
  );
}