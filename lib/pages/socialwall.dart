import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:politician_app/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';



class Social extends StatelessWidget {
  final List<Map<String, dynamic>> socialData = [
    {
      'icon': MyFlutterApp.facebook,
      'label': 'Facebook',
      'url': 'https://www.facebook.com/IndianNationalCongress',
      'color':Colors.blueGrey[800],
    },
    {
      'icon': MyFlutterApp.instagram,
      'label': 'Instagram',
      'url': 'https://www.instagram.com/incindia/',
      'color':Colors.deepPurple[700],
    },
    {
      'icon': MyFlutterApp.youtube,
      'label': 'YouTube',
      'url': 'https://www.youtube.com/user/indiacongress',
      'color':Colors.red[800],
    },
    {
      'icon': MyFlutterApp.twitter,
      'label': 'Twitter',
      'url': 'https://twitter.com/INCIndia',
      'color':Colors.lightBlue,

    },
  ];


  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Wall',style: TextStyle(color: Colors.black),),

      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: socialData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              String url = socialData[index]['url'];
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    socialData[index]['icon'],
                    size: 50,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    socialData[index]['label'],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Container(
                      color: socialData[index]['color'] )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
