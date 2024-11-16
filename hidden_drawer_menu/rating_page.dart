import 'package:bite_right/hidden_drawer_menu/rating_view.dart';
import 'package:flutter/material.dart';


class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset('assets/images/biterightlogo.png',width: 300,height: 300,),
                Spacer(),
                TextButton.icon(onPressed: () {
                  openRatingDialog(context);
                },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.green.withOpacity(0.1),
                        ),
                    ),
                    icon: Icon(Icons.star), label: Text('Rate us!',style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],

            ),
          )
      ),
    );
  }
  openRatingDialog(BuildContext context) {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: RatingView(),
      );
    },
    );
  }
}