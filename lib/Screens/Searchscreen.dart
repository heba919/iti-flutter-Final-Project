import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/CustomItems/MusicsItemList.dart';
import 'package:movie_app/Servier/APICalls.dart';

class SearchScree extends StatefulWidget {
  @override
  State<SearchScree> createState() => _SearchScreeState();
}

class _SearchScreeState extends State<SearchScree> {
  String inputData = "";
  List<Track> list = [];
  APICalls api = APICalls();

  callApi() async {
    List<Track> retlist = await api.searchfortrack(inputData);
    setState(() {
      list = retlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onSubmitted: (value) {
              setState(() {
                inputData = value;
              });
              callApi();
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => Musicitem(
              trac: list[index],
            ),
          ),
        )
      ],
    );
  }
}
