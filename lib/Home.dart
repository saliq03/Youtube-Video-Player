import 'package:flutter/material.dart';
import 'package:youtube_video_player/AddCourse.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4e7),
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flutter Courses",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30),),

                   ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                       child: Image.asset("assets/images/profile.png",fit: BoxFit.cover,height: 50,width: 50,)),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              children: [ Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF0F4E5B),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                ),
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Column(
                  children: [
                    Text("Hi,Saliq!",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                    Text("")
                  ],
                ),
              ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/7),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.445,
                  child:ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset("assets/images/sample.png",fit: BoxFit.cover,height: 150,width: 140,)),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              SizedBox(width: 200,child: Text("Flutter Beginners",style: TextStyle(fontFamily: "Poppins",fontSize: 22,fontWeight: FontWeight.bold),)),
                              Text("(8 Videos)",style: TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: 20),)
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                )
              ],
            )
          ],
        )
      ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Addcourse()));
    },backgroundColor: Color(0xFF0F4E5B)
      ,child: Icon(Icons.add,size: 40,color: Colors.white,),),
    );

  }
}
