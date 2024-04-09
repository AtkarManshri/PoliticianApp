import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:politician_app/pages/login_controller/LoginController.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final susername=TextEditingController();
  final semail=TextEditingController();
  final spassword=TextEditingController();

 // LoginController loginController= Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

         decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover)

          // image: DecorationImage(
          //   image: AssetImage('assets/bg.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top:2),
                  margin: EdgeInsets.only(top: 1,),
                  child: Image.asset('assets/images/clogo.png',
                    width: 100,
                    height: 100,),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Congress Party',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepOrange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Text("Email",
                        style:TextStyle(
                            fontWeight:FontWeight.w400
                        ) ),
                  ],
                ),
                SizedBox(height:5),
                //emailinput
                TextField(
                  controller: semail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    hintText: 'Enter your mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
              //  keyboardType: TextInputType.emailAddress,

                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Text("Password",
                        style:TextStyle(
                            fontWeight:FontWeight.w400
                        ) ),
                  ],
                ),
                SizedBox(height:5),
                //passwordinput
                TextField(
                  controller: spassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    prefixIcon: Icon(Icons.add_card),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     //loginController.skipLogin();
                    FirebaseAuth.instance.signInWithEmailAndPassword(email:semail.text, password: spassword.text).then((value) {
                      const snackBar = SnackBar(
                        content: Text('login  succesfully !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "nav");
                    }).onError((error, stackTrace) {
                      print("error is ${error.toString()}");
                    }
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16,
                    color:Colors.white ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, 'signup');
                      },
                      child: Text(
                        'SignUp?',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
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
//_loginState l=_loginState();