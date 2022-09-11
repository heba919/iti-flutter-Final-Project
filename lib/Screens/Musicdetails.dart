// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Servier/FavProvider.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../Servier/APICalls.dart';

class Musicdetails extends StatefulWidget {
  Track _track;
  Musicdetails(this._track);

  @override
  _MusicdetailsState createState() => _MusicdetailsState();
}

class _MusicdetailsState extends State<Musicdetails> {
  String lyrics;
  APICalls api = APICalls();

  @override
  void initState() {
    super.initState();

    callapi();
  }

  void callapi() async {
    String retlyrics =
        await api.getLyrics(widget._track.artist, widget._track.title);
    setState(() {
      lyrics = retlyrics;
    });
  }

// _launchURLBrowser(String ur) async {
//   var url = Uri.parse(ur);
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

  // final audioPlayer = AudioPlayer();
  // bool _isPlaying = false;
  // AudioPlayerState _audioPlayerState = AudioPlayerState.PAUSED;

  // @override
  // void initState() {
  //   super.initState();
  //   audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
  //     setState(() {
  //       _audioPlayerState == event;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   audioPlayer.release();
  //   audioPlayer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    if (lyrics == null) {
      return Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      );
    } else {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(220.0),
            child: AppBar(
              backgroundColor: Colors.black12,
              elevation: 25,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              // title: Text(
              //   widget._track.title,
              //   style: TextStyle(
              //       fontSize: 20,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w700,
              //       fontStyle: FontStyle.italic,
              //       letterSpacing: 2,
              //       wordSpacing: 10,
              //       // backgroundColor: Colors.,
              //       shadows: [
              //         Shadow(
              //             color: Colors.white,
              //             //   offset: Offset(2, 1),
              //             blurRadius: 20)
              //       ]),
              // ),
              flexibleSpace: Image(
                image: NetworkImage(widget._track.picture_path),
                // fit: BoxFit.fitWidth,
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: [
                IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      final _album =
                          Provider.of<FavProvider>(context, listen: false);
                      _album.addatfav(
                          widget._track.title, widget._track.picture_path);
                      scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Add To Your Favourite")));
                    })
              ],

              centerTitle: true,
            )),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(widget._track.title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(color: Colors.white, blurRadius: 20)
                        ])),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Listen To Music:"),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Text(
                      'Open Deezer',
                      style: TextStyle(shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(3, 4),
                            blurRadius: 10)
                      ]),
                    ),
                    //   onTap: () => _launchURLBrowser(widget._track.link)
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Artist:"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(widget._track.artist),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Duration:"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("${widget._track.duration} Sec"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Lyrics",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(color: Colors.white, blurRadius: 20)
                        ])),
                SizedBox(
                  height: 10,
                ),
                Container(margin: EdgeInsets.all(10), child: Text(lyrics))
              ])
            ])),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: (() async {
            // audioPlayer == AudioPlayerState.PLAYING
            //     ? await audioPlayer.pause()
            //     : await audioPlayer.play(widget._track.preview);
          }),
          // child: Icon((audioPlayer == AudioPlayerState.PLAYING)
          //     ? Icons.pause
          //     : Icons.play_circle_outline),
          // tooltip: "Play Music",
        ),
      );
    }
  }
}
