import 'dart:math';

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
        ShowDialogBox();
      },backgroundColor: Color(0xFF0F4E5B)
        ,child: Icon(Icons.add,size: 40,color: Colors.white,),),
    );
  }
  ShowDialogBox(){
    return showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        title:  Container(
          child: Column(
            children: [
              Row(
                children: [IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.cancel)),
                SizedBox(width: 30,),
                  Text("Add Video",style: TextStyle(color: Colors.blueAccent,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 22),)
                ]),
              SizedBox(height: 10,),
              Text("Add Youtube link",style: TextStyle(fontSize: 25,),),
              SizedBox(height: 10,),
              TextField(
                    decoration: InputDecoration(
                      hintText: "Add Link",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      )
                    ),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Color(0xFF0F4E5B),
                  ),
                  child: Center(child: Text("Add",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
              )

            ],
          ),
        )
      );
    });

  }
}
