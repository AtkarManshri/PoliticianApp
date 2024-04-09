import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
final susername=TextEditingController();
final  semail=TextEditingController();
final spassword=TextEditingController();


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
                /*Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Text("Username",
                        style:TextStyle(
                            fontWeight:FontWeight.w400
                        ) ),
                  ],
                ),*/
                SizedBox(height:5),
                TextField( controller: susername,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                /*Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Text("email",
                        style:TextStyle(
                            fontWeight:FontWeight.w400
                        ) )
                    ,
                  ],
                ),*/
                SizedBox(height:5),
                TextField(
                  controller: semail,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.mail_outline_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

              /*  Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Text("Password",
                        style:TextStyle(
                            fontWeight:FontWeight.w400
                        ) ),
                  ],
                ),*/
                SizedBox(height:20),
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
                    const snackBar = SnackBar(
                      content: Text('acc created'),
                    );
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: semail.text, password: spassword.text).then((value) {
                      Navigator.popAndPushNamed(context, 'nav');
                      print('account created');
                    }).onError((error, stackTrace) { print('failed to create');});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                  ),
                  child: Text(
                    'SignUp',
                    style: TextStyle(fontSize: 16,
                        color:Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context,'login');
                      },

                      child: Text(
                        'Login?',
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
