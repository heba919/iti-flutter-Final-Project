import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/Servier/FavProvider.dart';

class FavScreen extends StatefulWidget {
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("My Favorite"),
        ),
        body: ListView.builder(
          itemCount: fav.allfavmusic.length,
          itemBuilder: ((context, index) => ListTile(
                leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(fav.allfavmusic[index].img)),
                title: Text(fav.allfavmusic[index].title),
                trailing: IconButton(
                    onPressed: () {
                      fav.deletefronfav(fav.allfavmusic[index]);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red)),
              )),
        ));
  }
}
