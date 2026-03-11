import 'package:flutter/material.dart';
void main() {
runApp(MaterialApp(
debugShowCheckedModeBanner: false,
home: MyHome(),
));
}
class MyHome extends StatefulWidget {
@override
_MyHomeState createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
int index = 0;
List<Widget> pages = [
Center(child: Text("Home Screen")),
Center(child: Text("Explore Screen")),
Center(child: Text("Profile Screen")),
];
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Travel Guide"),
centerTitle: true,
),
drawer: Drawer(
child: ListView(
children: [
DrawerHeader(
decoration: BoxDecoration(color: Colors.blue),
child: Text("Menu", style: TextStyle(color: Colors.white)),
),
ListTile(title: Text("Home")),
ListTile(title: Text("Explore")),
ListTile(title: Text("Profile")),
],
),
),
body: pages[index],
bottomNavigationBar: BottomNavigationBar(
currentIndex: index,
onTap: (i) {
setState(() {
index = i;
});
},
items: [
BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
],
),
);
}
