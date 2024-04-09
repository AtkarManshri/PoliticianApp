import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:politician_app/pages/home.dart';
import 'package:politician_app/pages/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:politician_app/pages/navbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadScreen();
  }
  // Function to simulate loading time
  Future<void> _loadScreen() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      _isLoading = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>FirebaseAuth.instance.currentUser != null
          ? navbar()
          : login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/coverimg.jpg'),
                      fit: BoxFit.cover)
              ),
            ),
          ),
          if (_isLoading)
            Positioned(
              bottom: 80,
              left: 50,
              right: 50,
              child:
              LinearProgressIndicator(
                backgroundColor: Colors.blueGrey[700],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
