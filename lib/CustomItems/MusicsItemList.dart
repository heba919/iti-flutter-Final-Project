import "package:flutter/material.dart";
import 'package:movie_app/Screens/Musicdetails.dart';
import 'package:movie_app/Servier/APICalls.dart';
// import '../Screens/moviedetails.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/painting/_network_image_io.dart';

class Musicitem extends StatelessWidget {
  Track trac;
  Musicitem({this.trac});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => Musicdetails(trac))));
        // print(trac.artist);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 8,
        shadowColor: const Color(0xffb3b3b3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: ListTile(
          leading: Image.network(trac.picture_path),
          title: Text(trac.title),
          subtitle: Text(trac.artist),
          trailing: Column(children: [
            Icon(
              Icons.timelapse,
              color: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            Text("'${trac.duration}' Sec")
          ]),
        ),
      ),
    );
  }
}

// Card(
//           elevation: 8,
//                 shadowColor: const Color(0xff2da9ef),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(
//                     10,
//                   ),
//                 ),
//           child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 ListTile(
//                   leading: Image.network(clas.img,width: 50,height: 50),
//                   title: Text(clas.name),
//                   subtitle: Text(clas.describtion),
//                 ),
