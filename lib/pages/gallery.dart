import 'package:flutter/material.dart';

class gallery extends StatefulWidget {
  const gallery({super.key});

  @override
  State<gallery> createState() => _galleryState();
}

class _galleryState extends State<gallery> {

  List gallery = [
    "assets/gallery/1 (1).jpg",
    "assets/gallery/1 (2).jpg",
    "assets/gallery/1 (3).jpg",
    "assets/gallery/1 (4).jpg",
    "assets/gallery/1 (5).jpg",
    "assets/gallery/1 (6).jpg",
    "assets/gallery/1 (7).jpg",
    "assets/gallery/1 (8).jpg",
    "assets/gallery/1 (9).jpg",
    "assets/gallery/1 (10).jpg",
    "assets/gallery/1 (11).jpg",
    "assets/gallery/1 (12).jpg",
    "assets/gallery/1 (13).jpg",
    "assets/gallery/1 (14).jpg",
    "assets/gallery/1 (15).jpg",
    "assets/gallery/1 (16).jpg",
    "assets/gallery/1 (17).jpg",
    "assets/gallery/1 (18).jpg",
    "assets/gallery/1 (19).jpg",
    "assets/gallery/1 (20).jpg",
    "assets/gallery/1 (21).jpg",
    "assets/gallery/1 (22).jpg",
    "assets/gallery/1 (23).jpg",
    "assets/gallery/1 (24).jpg",
    "assets/gallery/1 (25).jpg",
    "assets/gallery/1 (26).jpg",
    "assets/gallery/1 (27).jpg",
    "assets/gallery/1 (28).jpg",
    "assets/gallery/1 (29).jpg",
    "assets/gallery/1 (30).jpg",
    "assets/gallery/1 (31).jpg",
    "assets/gallery/1 (32).jpg",
    "assets/gallery/1 (33).jpg",
    "assets/gallery/1 (34).jpg",
    "assets/gallery/1 (35).jpg",
    "assets/gallery/1 (36).jpg",
    "assets/gallery/1 (37).jpg",
    "assets/gallery/1 (38).jpg",
    "assets/gallery/1 (39).jpg",
    "assets/gallery/1 (40).jpg",
    "assets/gallery/1 (41).jpg",
    "assets/gallery/1 (42).jpg",
    "assets/gallery/1 (43).jpg",
    "assets/gallery/1 (44).jpg",
    "assets/gallery/1 (45).jpg",
    "assets/gallery/1 (46).jpg",
    "assets/gallery/1 (47).jpg",
    "assets/gallery/1 (48).jpg",
    "assets/gallery/1 (49).jpg",
    "assets/gallery/1 (50).jpg",
    "assets/gallery/1 (51).jpg",
    "assets/gallery/1 (52).jpg",
    "assets/gallery/1 (53).jpg",
    "assets/gallery/1 (54).jpg",
    "assets/gallery/1 (55).jpg",
    "assets/gallery/1 (56).jpg",
    "assets/gallery/1 (57).jpg",
    "assets/gallery/1 (58).jpg",
    "assets/gallery/1 (59).jpg",
    "assets/gallery/1 (60).jpg",
    "assets/gallery/1 (61).jpg",
    "assets/gallery/1 (62).jpg",
    "assets/gallery/1 (63).jpg",
    "assets/gallery/1 (64).jpg",
    "assets/gallery/1 (65).jpg",
    "assets/gallery/1 (66).jpg",
    "assets/gallery/1 (67).jpg",
    "assets/gallery/1 (68).jpg",
    "assets/gallery/1 (69).jpg",
    "assets/gallery/1 (70).jpg",
    "assets/gallery/1 (71).jpg",
    "assets/gallery/1 (72).jpg",
    "assets/gallery/1 (73).jpg",
    "assets/gallery/1 (74).jpg",
    "assets/gallery/1 (75).jpg",
    "assets/gallery/1 (76).jpg",
    "assets/gallery/1 (77).jpg",
    "assets/gallery/1 (78).jpg",
    "assets/gallery/1 (79).jpg",
    "assets/gallery/1 (80).jpg",
    "assets/gallery/1 (81).jpg",
    "assets/gallery/1 (82).jpg",
    "assets/gallery/1 (83).jpg",
    "assets/gallery/1 (84).jpg",
    "assets/gallery/1 (85).jpg",
    "assets/gallery/1 (86).jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title:Text("Gallery", style: TextStyle(
          fontSize: 23.0,
          color: Colors.white,
        ),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.lightBlueAccent, Colors.blue]
            ),
          ),
        ),

      ),
        body: GridView.count(
    crossAxisCount: 2,

           children: List.generate(gallery.length, (index) {
          return Card(
            
              child: Image.asset(gallery[index]),

          );
        }
    ),
    )
    );
  }
}

