import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class opinion extends StatefulWidget {
  const opinion({Key? key}) : super(key: key);

  @override
  State<opinion> createState() => _opinionState();
}

class _opinionState extends State<opinion> {
  final currentUser=FirebaseAuth.instance.currentUser;
  TextEditingController opinionController = TextEditingController();

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Thankyou !' ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 21),)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('Your opinion has been sent \n \t\t\t\t\t\t\t\t successfully',style: TextStyle(fontSize: 18),)),
               SizedBox(height: 20,),

               Center(
                 child: Icon(Icons.done_outline_rounded,color: Colors.green,),
               )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _submitOpinion(String opinion) {
    if (opinion.isNotEmpty) {
      // FirebaseFirestore.instance
      //     .collection('Users')
      //     .doc(opinion)
      //     .set({'opinions': opinion}).then((_) {
      //   print('Opinion sent successfully');


      FirebaseFirestore.instance
          .collection('Users')
          .doc(opinion)
          .set({'opinions': opinion,'email':currentUser?.email}).then((_) {
        print('Opinion sent successfully');
      }).catchError((error) {
        print('Failed to send opinion: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send your opinion.'),
          ),
        );
      });
    } else {
      print('No opinion added');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          "Opinion",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.lightBlueAccent, Colors.blue],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/opinion.png'),
                fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    children: [
                      // Your other widgets can go here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: opinionController,
                maxLines: null, // Allow multiline input
                decoration: const InputDecoration(
                  hintText: "Give your opinion",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              height: 65,
              width : 35,
                          // foregroundDecoration:
              // BoxDecoration
              //   (
              //
              //     border: Border.all(),
              //     borderRadius: BorderRadius.all(Radius.circular(50)),
              //
              //
              // ) ,
              child: IconButton(
                onPressed: () {
                  _submitOpinion(opinionController.text.trim());
                  setState(() {
                    opinionController.clear();
                    showMyDialog();
                  });
                },
                icon: const Icon(Icons.send_rounded),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

