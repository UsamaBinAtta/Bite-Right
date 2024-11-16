import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
                        'About',
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
                      'Welcome to our Halal Food Checker Application, where you can easily find halal food options near you. Our app is designed to help Muslims and anyone who seeks halal food options to quickly and easily find restaurants and food products that meet their dietary requirements.\n\n\nAt Halal Food Checker, we understand the importance of consuming halal food for our Muslim community. We believe that finding halal food options should be convenient and accessible to everyone. Therefore, we have developed this app to provide accurate and reliable information about halal food.\n\n\nOur app allows you to search for halal food by location, restaurant name, or product name. You can also filter your search by cuisine type, such as Middle Eastern, Asian, or American, to find the perfect halal meal for your taste buds.\n\n\nIn addition to finding halal food options, our app provides information on halal certification and guidelines for halal food. We work closely with halal certification organizations to ensure that all the information we provide is up-to-date and accurate.\n\n\nWe believe that everyone has the right to know what they are consuming and to make informed choices about their food. Our app is here to make that process easier for you. We hope that you find our app helpful in your search for halal food options, and we are always open to feedback and suggestions to improve our service.',
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
