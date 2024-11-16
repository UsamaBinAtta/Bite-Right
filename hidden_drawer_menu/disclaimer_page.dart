import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 80,bottom: 2,left: 60,right: 25),
          color: Color(0xffc6dfca),
          child: Stack(
              children: [
                Text(
                  'BITE RIGHT.',
                  style: TextStyle(
                      fontFamily: 'BiteRightFont',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff355e3b),
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 65.0,horizontal: 20.0),
                  child: Text(
                    'Disclaimer',
                    style: TextStyle(
                      fontFamily: 'HeadingBoldFont',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ]
          ),
        ),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(top: 250),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 21,
                        spreadRadius: 10,color: Color(0xff355e3b)
                    )
                  ]
              ),
            child: SingleChildScrollView(
                child: Container(
                  child: ReadMoreText(
                      'The Halal food checker application is intended to provide general guidance and information to users who are seeking halal food options. While we strive to ensure the accuracy and reliability of the information provided, we cannot guarantee that all of the data on the application is up-to-date, complete, or accurate.\n\n\nThe information provided by the Halal food checker application is not a substitute for professional advice and should not be relied upon as such. We strongly recommend that users consult with qualified professionals or halal certification bodies to verify the halal status of food items or restaurants.\n\n\nFurthermore, the Halal food checker application does not endorse or recommend any particular restaurant or food item, and users should exercise their own judgement and discretion when selecting their meals.\n\n\nFinally, we do not assume any liability for the use or interpretation of the information provided on the Halal food checker application. Users acknowledge that they use the application at their own risk and agree to indemnify and hold harmless the developers of the application from any claims, damages, or losses resulting from the use of the application or reliance on the information provided.',
                    trimLines: 21,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Show Less',
                    lessStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff355e3b),
                    ),
                    moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff355e3b),),
                    style: TextStyle(
                      fontFamily: 'ParaFont',
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                )) ,

          ),

        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 7),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
          backgroundColor: Color(0xffc6dfca),
          child: Text('X',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.grey[200]),),
          tooltip: 'Back',
          mini: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}