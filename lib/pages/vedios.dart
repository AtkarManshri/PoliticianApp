import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class vedios extends StatefulWidget {
  const vedios({Key? key}) : super(key: key);
  @override
  State<vedios> createState() => _vediosState();
}

class _vediosState extends State<vedios> {
  late Future<void> _videosLoadedFuture;

  @override
  void initState() {
    super.initState();
    _videosLoadedFuture = _loadVideos();
  }

  Future<void> _loadVideos() async {
    // Simulate loading delay
    await Future.delayed(Duration(seconds: 5));
  }

  List<String> videoIds = [
    "PL-3LxLXzzQ", "w-YLcV72U0c", "FgSNBMeHc4g", "eKDyZsEhBZ8", "dtvNMy7HEKI"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Videos",
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
      body: FutureBuilder<void>(
        future: _videosLoadedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while videos are loading
            return Center(
              child: SpinKitPouringHourGlass(color: Colors.blue,)
            );
          } else {
            // Once videos are loaded, display them
            return ListView.builder(
              itemCount: videoIds.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(15),
                  elevation: 5.0,
                  shadowColor: Colors.indigo[200],
                  surfaceTintColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {},
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videoIds[index],
                          flags: YoutubePlayerFlags(
                            autoPlay: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
