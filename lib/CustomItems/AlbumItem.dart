import "package:flutter/material.dart";
//import 'package:url_launcher/url_launcher.dart';
import 'package:movie_app/Servier/APICalls.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/Servier/FavProvider.dart';

class AlbumItem extends StatefulWidget {
  Album alb;
  AlbumItem({this.alb});

  @override
  _AlbumItemState createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              trailing: IconButton(
                  icon: const Icon(Icons.favorite),
                  tooltip: 'Add to Fav',
                  onPressed: () {
                    final _album =
                        Provider.of<FavProvider>(context, listen: false);
                    _album.addatfav(widget.alb.title, widget.alb.coverImg);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Add To Your Favourite")));
                  }),
              leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.alb.picArtist)),
              title: Text(widget.alb.artist),
              subtitle: InkWell(
                child: Text(
                  'Listen To Album on Deezer',
                  style: TextStyle(fontSize: 13, shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(3, 4),
                        blurRadius: 10)
                  ]),
                ),
                //   onTap: () =>  _launchURLBrowser(alb.link)
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 290,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.alb.coverImg),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              // leading: Text("data"),
              title: Text(widget.alb.title),

              subtitle: Row(children: [
                Text(
                  'Number of Tracks:',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${widget.alb.numTracks}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
