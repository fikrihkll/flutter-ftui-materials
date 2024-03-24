import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Text("Text ke-1"),
                Text("Text ke-2"),
                Text("Text ke-3"),
                Row(
                  children: [
                    Text("Text ke-1"),
                    Text("Text ke-2"),
                    Text("Text ke-3"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text("Text ke-1"),
                Text("Text ke-2"),
                Text("Text ke-3"),
              ],
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  Positioned(
                      top: 3,
                      left: 3,
                      child: Text("AAAAAAAAAAAAAA")
                  ),
                  Positioned(
                      top: 16,
                      left: 8,
                      child: Text("LLLLLLLLLLLLLL")
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  width: 5,
                  color: Colors.red
                ),
                borderRadius: BorderRadius.circular(16)
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.3,
                wordSpacing: 1.4,
              ),
            ),
            Image.network(
              "https://www.telegraph.co.uk/content/dam/travel/Spark/tui-lakes-and-mountains/lake-garda-with-mountains.jpg?imwidth=1200",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            MaterialButton(
                child: Text("Click me!"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(16)
                ),
                onPressed: () {
                  // Aksi
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hi all...")));
                }
            ),
            const SizedBox(height: 16,),
            Container(
              width: 80,
              height: 80,
              color: Colors.grey,
            ),
            Text("I'm in between of 2 containers, I don't have any space"),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 16),
                child: Text("Hi, my name is Jake!"),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text("I'm in between of 2 containers, give me some space!!")
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.green,
              child: Text("Hi, my name is Cassandra!"),
            ),
          ],
        )
      ),
    );
  }
}
