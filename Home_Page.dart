import 'package:bite_right/hidden_drawer_menu/about_page.dart';
import 'package:bite_right/hidden_drawer_menu/disclaimer_page.dart';
import 'package:bite_right/hidden_drawer_menu/guide_page.dart';
import 'package:bite_right/hidden_drawer_menu/help_page.dart';
import 'package:bite_right/hidden_drawer_menu/rating_page.dart';
import 'package:bite_right/hidden_drawer_menu/who_we_are.dart';
import 'package:bite_right/nav_bar_pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'nav_bar_pages/landing_page.dart';
import 'nav_bar_pages/maps_page.dart';
import 'nav_bar_pages/scan_page.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // page navigation
  int currentIndex = 0;

  void _navigateBottomBar(int index) {

    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _pages =[
    LandingPage(),
    MapsPage(),
    ScanPage(),
    SearchPage(),


  ];


  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(color: Color(0xff355E3B),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            selectedIndex : currentIndex,
            onTabChange: _navigateBottomBar,
            gap: 8,
            backgroundColor: Color(0xff355E3B),
            color: Colors.white,
            activeColor: Colors.white,tabBackgroundColor: Color(0xff6fae78),
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home,
                text: 'Home',),
              GButton(icon: Icons.location_pin,
                text: 'Maps',),
              GButton(icon: Icons.camera_alt_outlined,
                text: 'scan',),
              GButton(icon: Icons.manage_search_sharp,
                text: 'Search',),
            ],
          ),
        ),
      ),
      appBar: AppBar(elevation: 0,
        actions: [
        IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout)
        )
      ],
        backgroundColor: Color(0xff355E3B),
        title: Text('Welcome'),
        centerTitle: true,
      ),
      //body:Center(child: Text('Logged In AS :' + user.email!)),
      drawer: Drawer(
        child: Container(
          color: Color(0xffc6dfca),
          child: ListView(
            children: [
              DrawerHeader(
                  child:Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(9.0),
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))
                    ),
                  ),
                  Text(user.email!,style: TextStyle(
                      color: Color(0xff355e3b) ,
                      fontSize: 15,
                  ),
                  )
                ],
              )
              ),
              SizedBox(height: 50),
              ListTile(
                leading: Icon(Icons.info,color: Color(0xff355e3b)),
                title: Text(
                  'About',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.add_alert_sharp,color: Color(0xff355e3b)),
                title: Text(
                  'Disclaimer',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisclaimerPage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.mobile_friendly_rounded,color: Color(0xff355e3b)),
                title: Text(
                  'Guide',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuidePage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.help_rounded,color: Color(0xff355e3b)),
                title: Text(
                  'Help',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpPage()));
                },
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Color(0xff355e3b)),
                title: Text(
                  'Who we are?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UsPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.star_rate,color: Color(0xff355e3b)),
                title: Text(
                  'Rate & Review',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff355e3b), ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RatingPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
