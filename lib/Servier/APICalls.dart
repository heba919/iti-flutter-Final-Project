import 'dart:convert';
import 'package:http/http.dart';
//import 'package:intl/intl.dart';
// import 'package:deep_pick/deep_pick.dart';

class APICalls {
  Future getTrack(int id) async {
//https://api.deezer.com/track/3135552
    Track retutnedList;
    Uri url = Uri.https("api.deezer.com/", "track/", {'q': '$id'});
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      // var temp = converted["results"] as List;
      retutnedList = converted
          .map((elem) => Track(
              id: elem['id'],
              title: elem['title'],
              pic: elem['md5_image'],
              link: elem['link'],
              duration: elem['duration'],
              preview: elem['preview']))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<Album> getAlbums(int id) async {
    //https://api.deezer.com/album/302127
    Album retutnedList;
    try {
      Uri url = Uri.https("api.deezer.com", "/album/$id");
      Response data = await get(url);
      if (data.statusCode == 200) {
        // var converted = jsonDecode(data.body);
        // print(converted);
        retutnedList = Album.fromJson(jsonDecode(data.body));

        // retutnedList = converted.map((elem) => Album(
        //     id: elem['id'],
        //     title: elem['title'],
        //     coverImg: elem['cover'],
        //     link: elem['link'],
        //     numTracks: elem['nb_tracks'],
        //     artist: elem['artist']['name'],
        //     picArtist: elem['artist']['picture']));

      } else {
        print("Error");
      }
      // print(retutnedList.numTracks);
      return retutnedList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Track>> searchfortrack(String value) async {
    //https://api.deezer.com/search?q=eminem

    List<Track> retutnedList = [];

    Uri url = Uri.https("api.deezer.com", "/search", {'q': value});
    Response data = await get(url);

    if (data.statusCode == 200) {
      try {
        var converted = jsonDecode(data.body);
        var temp = converted["data"] as List;
        // var temp1 = converted["data"]["artist"] as List;
        // var arist = temp["artist"]['name'] ;
        // final h = pick(converted, 'data', 1, 'artist', 0).asStringOrThrow();
        retutnedList = temp
            .map((elem) => Track(
                id: elem['id'],
                title: elem['title'],
                pic: elem['md5_image'],
                link: elem['link'],
                duration: elem['duration'],
                preview: elem['preview'],
                artist: elem['artist']['name']))
            .toList();

        //print(retutnedList);

        // retutnedList =
        //     temp1.map((elem) => Track(artist: elem['name'])).toList();

      } catch (e) {
        print(e);
      }
    } else {
      print("Error");
    }

    return retutnedList;
  }

  Future<String> getLyrics(String artist, String title) async {
    //https://api.lyrics.ovh/v1/artist/title

    Uri url = Uri.https("api.lyrics.ovh", "/v1/$artist/$title");
    Response data = await get(url);
    try {
      if (data.statusCode == 200) {
        var converted = jsonDecode(data.body);

        return (converted['lyrics']);
      } else if (data.statusCode == 404) {
        var converted = jsonDecode(data.body);

        return (converted['error']);
      }
    } catch (e) {
      print(e);
    }
  }
}

class Album {
  int id;
  String title;
  String link;
  String coverImg;
  String artist;
  int numTracks;
  String picArtist;
  // List<Track> tracks;

  factory Album.fromJson(dynamic json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
      coverImg: json['cover'] as String,
      link: json['link'] as String,
      artist: json['artist']['name'] as String,
      numTracks: json['nb_tracks'] as int,
      picArtist: json['artist']['picture'] as String,
    );
  }

  @override
  Album(
      {this.id,
      this.title,
      this.coverImg,
      this.link,
      this.artist,
      this.numTracks,
      this.picArtist});
}

class Track {
  int id;
  String artist;
  String title;
  String link;
  int duration;
  String preview;
  String picture_path;
  String pic;
  String path1 = "https://e-cdn-images.dzcdn.net/images/cover/";
  String path2 = "/264x264-000000-80-0-0.jpg";

  Track(
      {this.id,
      this.title,
      this.link,
      this.duration,
      this.preview,
      this.pic,
      this.artist}) {
    this.picture_path = "${this.path1}${pic}${this.path2}";

    // Track.fromJson( Map<String, dynamic> json)
    // {

    // };
  }
}

// class Artist {
//   String name;
//   String link;
//   String picture;
//   Artist({this.name, this.link, this.picture});
// }
