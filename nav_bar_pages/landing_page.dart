import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/landingpageimg.jpg'),
                    fit: BoxFit.cover
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Color(0xff355E3B).withOpacity(.5),
                        Color(0xff355E3B).withOpacity(.1),
                      ])
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'What Would you like to find?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35, fontFamily: 'ParaFont',
                          fontWeight: FontWeight.bold),
                    ),SizedBox(height: 65),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Recommended Food',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.grey[800]),),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/McChicken.png', title: 'McChicken'),
                        makeItem(image: 'assets/images/Hot-N-Crispy.png', title: 'Hot-N-Crispy'),
                        makeItem(image: 'assets/images/McArabia.png', title: 'McArabia'),
                        makeItem(image: 'assets/images/BBQWrap.png', title: 'BBQ Wrap'),
                        makeItem(image: 'assets/images/Bigmac.png', title: 'Big Mac'),
                        makeItem(image: 'assets/images/Double-McChicken.png', title: 'Double McChicken'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Best Food',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.grey[800]),),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/Double-McChicken.png', title: 'Double McChicken'),
                        makeItem(image: 'assets/images/Bigmac.png', title: 'Big Mac'),
                        makeItem(image: 'assets/images/BBQWrap.png', title: 'BBQ Wrap'),
                        makeItem(image: 'assets/images/McArabia.png', title: 'McArabia'),
                        makeItem(image: 'assets/images/Hot-N-Crispy.png', title: 'Hot-N-Crispy'),
                        makeItem(image: 'assets/images/McChicken.png', title: 'McChicken'),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,)

                ],
              ),
            )
          ],
        ),
      ),

    );

  }
  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(image),
            fit: BoxFit.cover,
          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Color(0xff355E3B).withOpacity(.5),
                    Color(0xff355E3B).withOpacity(.1),
                  ]
              )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
