import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daylee",
          style: TextStyle(
            color: Colors.black, 
            fontSize: 15.0),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
          children: [
            Text("Add alarm"),
            Spacer(),
            IconButton(onPressed: null, icon: Icon(Icons.add),
            alignment: Alignment.bottomRight,)
          ],
        ),

        Image.asset("images/daylee.jpg",
        width: 800.0,
        height: 200.0,),

        ListView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.pink,
            ),
            label: "AD info"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            label: "SETTINGS")
      ]),
    );
  }
}
