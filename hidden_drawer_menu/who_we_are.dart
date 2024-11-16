import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UsPage extends StatelessWidget {
  const UsPage({Key? key}) : super(key: key);

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
                        'Who We Are?',
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
                      'Assalam u Alaikum!\n\nHere is a little text to introduce us, so you know who is behind this application.\n\n\nUSAMA, MUNEEB, and TOQEER, three friends who share a common passion for promoting Halal food options for the Muslim community. As part of their final year project, they have come together to develop a Halal food checker application that will help Muslims make informed decisions about their food choices.\n\n\nFrom start to finish, USAMA and MUNEEB worked on this project, taking on every task with enthusiasm and precision. They conducted in-depth research, designed and implemented a sound methodology, and meticulously analyzed their findings to arrive at insightful and well-supported conclusions.\n\n\nDespite encountering some challenges along the way, USAMA and MUNEEB remained focused and determined, and never let any obstacle deter them from achieving their goals. They were resourceful, creative, and innovative in their approach, and demonstrated an exceptional level of competence and professionalism throughout the project.\n\n\nOh, let us tell you about our "dear" friend TOQEER who was an absolute pro at not doing any work on our project. I mean, it takes real talent to be able to sit around and do absolutely nothing while the rest of us were working.\n\nI mean, it takes real skill to be able to contribute absolutely nothing to a group project.Its almost like TOQEER was a magician, able to disappear and reappear at will, but without the cool magic tricks.\n\n\nAll jokes aside, Together, MUNEEB , USAMA, and TOQEER make a formidable team, combining their unique skills and perspectives to develop a halal food checker application that is innovative and practical. They are committed to making a positive impact on the Muslim community and promoting halal food options that are healthy, sustainable, and culturally relevant. With their hard work and dedication, they are well on their way to achieving their final year project and making a real difference in the world.',
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