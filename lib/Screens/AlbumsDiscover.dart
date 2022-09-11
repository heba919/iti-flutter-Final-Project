import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/CustomItems/AlbumItem.dart';
import 'dart:math';

import 'package:movie_app/Servier/APICalls.dart';

class AlbumList extends StatefulWidget {
  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  Album _album;
  @override
  void initState() {
    Random random = new Random();
    int randomNumber = random.nextInt(999999);
    callAPI(randomNumber);
    super.initState();
  }

  callAPI(int num) async {
    var api = APICalls();
    Album returnedlist = await api.getAlbums(num);

    setState(() {
      _album = returnedlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container();

    if (_album == null) {
      return Scaffold(
        body:
            // return
            Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.white30,
                  ),
                )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: (() async {
            Random random = new Random();
            int randomNumber = random.nextInt(999999);
            callAPI(randomNumber);
          }),
          child: Icon(Icons.refresh),
          tooltip: "Refresh",
        ),
      );
    } else {
      return Scaffold(
        body:
            // return
            Container(
                margin: EdgeInsets.all(20),
                child: AlbumItem(
                  alb: _album,
                )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: (() async {
            Random random = new Random();
            int randomNumber = random.nextInt(999999);
            callAPI(randomNumber);
          }),
          child: Icon(Icons.refresh),
          tooltip: "Refresh",
        ),
      );
    }
  }
}
