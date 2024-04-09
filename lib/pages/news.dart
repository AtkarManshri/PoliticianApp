
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:politician_app/pages/components/LikeButton.dart';


 Future<Newsfeed> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://newsdata.io/api/1/news?apikey=pub_36583a5019b443c7bb24c52fee168ccb62627&q=I.N.D.I.A'));
//
  if (response.statusCode == 200)
  {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Newsfeed.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
//api data class json to dart class--
class Newsfeed {
  String? status;
  int? totalResults;
  List<Results>? results;
  String? nextPage;

  Newsfeed({this.status, this.totalResults, this.results, this.nextPage});

  Newsfeed.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;
    return data;
  }
}

class Results {

  String? title;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;

  Results(
      {
        this.title,
        this.description,
        this.content,
        this.pubDate,
        this.imageUrl,
      }
      );

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    ;
    return data;
  }
}
//widget
class news extends StatefulWidget {
   // final String user;
   // final List<String> likes;
  //const news({super.key, required this.user, required this.likes});

 const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
//
//   void Function()? onTap;
 final currentUser=FirebaseAuth.instance.currentUser!;
 bool isLiked=false;


  late Future<Newsfeed> futureAlbum;
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    //isLiked= widget.likes.contains(currentUser.email);
  }
  // void toggleLike(){
  //   setState(() {
  //     isLiked=true;
  //   });
  //
  //   DocumentReference postRef= FirebaseFirestore.instance.collection('User likes').doc(widget.user);
  //   if(isLiked)
  //     {
  //       postRef.update({
  //         "likes":FieldValue.arrayUnion([currentUser.email])
  //
  //       });
  //     }
  //   else{
  //     {
  //       postRef.update({
  //         "likes":FieldValue.arrayRemove([currentUser.email])
  //
  //       });
  //     }
  //   }
  // }

  /*@override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_)
   async {
     Future<List<Newsfeed>> newsfeed;
     var url = Uri.parse("https://newsdata.io/api/1/news?apikey=pub_36583a5019b443c7bb24c52fee168ccb62627&q=bjp");
     var response = await http.get(url);
   });
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title:Text("News",
          style: TextStyle(
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
      body:Container(
          child: FutureBuilder(
            future: futureAlbum,
            builder: (context, snapshot)
            {
               return ListView.separated(
                itemCount: snapshot.hasData?snapshot.data!.results!.length:1,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index)
                {
                  if(snapshot.hasData){
                    Results newsItem = snapshot.data!.results![index];
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        color:Colors.grey[50],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),

                        shadowColor: Colors.indigo[200],
                        child: Column(
                          children: [
                            SizedBox(height: 14),
                             ListTile(
                               title: Text(newsItem.title ?? ''),
                             subtitle: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 8),
                               Text(newsItem.pubDate ?? '',
                               style: TextStyle(
                                 color: Colors.indigo[800],
                               ),
                               ),
                               SizedBox(height: 8),
                          //       Text(newsItem.description ?? ''),
                          //       //Text(parse(newsItem.description ?? '') as String),
                          //     ],
                          //   ),
                          //   leading: newsItem.imageUrl != null
                          //       ? Image.network(newsItem.imageUrl!)
                          //       : null,
                                 ],
                               ),
                             ),
                            Card(
                              child:  newsItem.imageUrl != null ? Image.network(newsItem.imageUrl!) : null,
                            ),

                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              child: Divider(
                                thickness: 2.0,
                                color: Colors.grey[300],
                              ),
                            ),


                            // Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround
                            //   ,
                            //   children: [
                            //     //Padding(padding: EdgeInsets.all(5)),
                            //     LikeButton(isLiked: true, onTap:(){}
                            //     //toggleLike),
                            //     //Text(widget.likes.length.toString()
                            //     ),
                            //     IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                            //     IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded)),
                            //   ],
                            // )
                             ],
                        ),
                      ),
                    );
                    //return Card(
                      //    child: Text(snapshot.data!.results![index].description.toString()),);
                  }
                  return  Center (

                  child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 300, 50, 100),
                      child: SpinKitChasingDots(
                        color: Colors.blue,
                      )
                      //CircularProgressIndicator()
                   ),
                  );
                },
              );
            },

          ),
        ),
      );
  }
}
