import 'package:arrow_path/arrow_path.dart';
import 'package:dc/widgets/pie_chart.dart';
import 'package:dc/widgets/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math' as math;
class PaymentTracker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
    
    Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Payment Tracker",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 16,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.white60,blurRadius: 20)]),)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 200,
                width: width*0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Colors.white24,Colors.white10,])
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: PieChartPage()),
                    ),
                       Padding(
                         padding: const EdgeInsets.only(left:170.0,bottom: 40),
                         child: Center(
                           child: Container(
                             
                             height: 50,
                             width: 140,
                              
                              child: CustomPaint(
                                painter: ArrowPainter(clr: Colors.deepOrange),
                              ),
                      ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top:140.0,left: 20),
                         child: Center(
                           child: RotatedBox(
                             quarterTurns: 1,
                             child: Container(
                               
                               height: 50,
                               width: 140,
                                
                                child: CustomPaint(
                                  painter: ArrowPainter(clr: Colors.orange),
                                ),
                                           ),
                           ),
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(right:180,bottom: 40),
                         child: Center(
                           child: RotatedBox(
                                 quarterTurns: 2,
                                 child: Container(
                                   
                                   height: 50,
                                   width: 120,
                                    
                                    child: CustomPaint(
                                      painter: ArrowPainter(clr: Colors.grey),
                                    ),
                                               ),
                               ),
                         ),
                       ),
                        Padding(
                         padding: const EdgeInsets.only(left:230.0,bottom: 100),
                         child: Center(
                           child: Container(
                             
                             height: 50,
                             width: 140,
                              
                              child: chartdata()
                      ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top:165.0,left: 140),
                         child: Center(
                           child: Container(
                             
                             height: 50,
                             width: 140,
                              
                              child:chartdata()
                                         ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right:220.0,top: 90),
                         child: Center(
                           child: Container(
                             
                             height: 50,
                             width: 120,
                              
                              child:chartdata()
                                         ),
                         ),
                       ),
                    
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ListView(
                physics: NeverScrollableScrollPhysics(),            
                shrinkWrap: true,
                children: [
                  PaymentCards(width),
                  PaymentCards(width),
                  PaymentCards(width),
                  PaymentCards(width),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  
  
  }

  Container PaymentCards(double width) {
    return Container(
            margin: EdgeInsets.only(left:22,right: 22,top: 5,bottom: 5),
            padding: EdgeInsets.all(20),
            height: 100,
            width: width*0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Colors.white24,Colors.white10,],
                    begin: Alignment(-1.0, 0.0),
                    end: Alignment(1.0, 0.0,),
                  transform: GradientRotation(math.pi / 4),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2nd INSTALLMENT",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                    SizedBox(height: 7,),
                    Text("3 OCT 2021",style: TextStyle(color: Colors.white60,fontSize: 10),),
                    SizedBox(height: 5,),
                    Text("REF ID : 0121232286",style: TextStyle(color: Colors.white60,fontSize: 10),)
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text("₹ 22,000",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset("assets/icons/upi.png",height: 20,width: 25,),
                        SizedBox(width: 5,),
                        Text("Success",style: TextStyle(color: Colors.green,fontSize: 12),)
                      ],
                    )
                  ],
                )
              ],
            ),
          );
  }

}
Column chartdata(){
  return Column(
    children: [
      Text("22,000",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
      SizedBox(height:4),
      Text("Total amount",style: TextStyle(fontSize: 8,color: Colors.white),)
    ],
  );
}

class ArrowPainter extends CustomPainter {
  Color? clr;
  ArrowPainter({this.clr});
  @override
  void paint(Canvas canvas, Size size) {
    Path path;
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;

    /// Draw a single arrow.
    path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.10);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
    path = ArrowPath.make(path: path);
    canvas.drawPath(path, paint..color = clr!);
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => true;
}