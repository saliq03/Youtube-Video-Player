import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Text("Flutter Courses",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22)
              ),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Column(
                children: [
                  Text("Saliq javid")
                ],
              ),
            )
          ],
        )
      ));
  }
}
