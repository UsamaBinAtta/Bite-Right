//import 'package:flutter/cupertino.dart';
//import 'dart:js';

//import 'dart:js';
import 'package:bite_right/auth_services.dart';
import 'package:bite_right/components/my_button.dart';
import 'package:bite_right/components/my_text_field.dart';
import 'package:bite_right/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  // sign user Up method

  void signUserUp() async{

    // show loading circle
    showDialog(
      context: context,
      builder: (context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try{
      // check if password is confirmed
        if (passwordController.text == confirmpasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,

        );
        }else {
          // show the error message----- Password Don,t Match//
          showErrorMessage('Passwords Dont Match!');
        }


      // pop the loading circle

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle

      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }


  }

  // Error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green[900],
          title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white) ,)
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(height: 25),

                //logo
                Icon(
                  Icons.lock,
                  size: 50,
                ),
                SizedBox(height: 25),



                // Welcome Back
                Text(
                  'Let\'s Create an Account for you',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),

                ),

                SizedBox(height: 25),

                // Username text_field
                MyTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                //password text_field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                SizedBox(height: 10),

                // confirm_password text_field
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),


                SizedBox(height: 25),
                //sign in button

                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),

                SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(color: Colors.grey[700]),

                        ),
                      ),

                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                // google + apple sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/google.png'),

                    SizedBox(width: 10),

                    // apple button
                    SquareTile(
                        onTap: (){},
                        imagePath: 'assets/images/apple.png'),
                  ],
                ),

                SizedBox(height: 50),

                // Already Have an Account? Log In Now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}