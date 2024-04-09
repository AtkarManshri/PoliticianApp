import 'package:flutter/material.dart';

class ViewCards extends StatefulWidget {
  const ViewCards({super.key});

  @override
  State<ViewCards> createState() => _ViewCardsState();
}

class _ViewCardsState extends State<ViewCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'cardview'
        ),
      ),
    );
  }
}
