import 'package:flutter/material.dart';
import 'package:movie_app/Screens/AlbumsDiscover.dart';
import 'package:movie_app/Screens/Searchscreen.dart';
import 'package:movie_app/Screens/FavScreen.dart';
import 'package:movie_app/Screens/welcome.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selected = 0;
  List<Widget> screens = [AlbumList(), SearchScree()];
  List<String> titles = ["Explore", "Search"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selected])),
      body: screens[selected],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromRGBO(245, 245, 220, 1),
        currentIndex: selected,
        type: BottomNavigationBarType.fixed,
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: "Home",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: "Albums",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/236x/da/98/c4/da98c4ffa15814790f0ffeae1d795701.jpg",
                  )),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 10),
                  Text("Your Profile"),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 24.0,
                  ),
                  SizedBox(width: 10),
                  Text("Your Favourit"),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavScreen()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 24.0,
                  ),
                  SizedBox(width: 10),
                  Text("Log Out"),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
