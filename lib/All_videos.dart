import 'package:flutter/material.dart';

class AllVideos extends StatefulWidget {
  final String title;
  final String image;

  const AllVideos({required this.title,required this.image});


  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
            color: Color(0xFFFFF4e7),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Poppins"),),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.image,fit: BoxFit.cover,height: 50,width: 50,)),
            ],)),
            Expanded(
              child: Column(
                children: [

                ],
              ),
            )
            ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },backgroundColor: Color(0xFF0F4E5B)
        ,child: Icon(Icons.add,size: 40,color: Colors.white,),),
    );
  }
}
