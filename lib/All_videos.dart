

import 'package:flutter/material.dart';
import 'package:youtube_video_player/playVideo.dart';
import 'package:youtube_video_player/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllVideos extends StatefulWidget {
  final String title;
  final String image;
  final String id;
  int count;

   AllVideos({required this.title,required this.image,required this.id,required this.count});

  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  TextEditingController addVideoController=TextEditingController();
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
                  child: Image.network(widget.image,fit: BoxFit.cover,height: 50,width: 50,)),
            ],)),
            Expanded(child: Container(child: MyStreambuildre()))
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
                controller: addVideoController,
                    decoration: InputDecoration(
                      hintText: "Add Link",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      )
                    ),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(addVideoController!=""){
                    widget.count=widget.count+1;
                    String? thumbnail=getThumbnail(addVideoController.text);
                    DatabaseMethods().UpdataCount(widget.id, widget.count);
                    DatabaseMethods().addVideo(widget.id, addVideoController.text, thumbnail!)
                    .then((value){
                      addVideoController.text='';
                      Fluttertoast.showToast(
                          msg: "Video Added Sucessfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      });
                    Navigator.pop(context);
                  }


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

  String? getThumbnail( String videoUrl){
    String videoId = '';
    if (videoUrl.contains('youtube.com')) {
      final uri = Uri.parse(videoUrl);
      videoId = uri.queryParameters['v'] ?? '';
     return 'https://img.youtube.com/vi/$videoId/0.jpg';
    } else if (videoUrl.contains('youtu.be')) {
      final uri = Uri.parse(videoUrl);
      videoId = uri.pathSegments.last;
      return 'https://img.youtube.com/vi/$videoId/0.jpg';
    }
    return null;

  }

  Widget MyStreambuildre(){
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Courses").doc(widget.id).collection("Videos").snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: widget.count,
                  itemBuilder: (context,index){
                    DocumentSnapshot ds=snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Playvideo(name:widget.title, link: ds["Link"])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Image.network(ds["Image"],fit: BoxFit.cover,height: 200,)),
                            );

                  });
            }
            else if(snapshot.hasError){
              return Center(child: Text("Error found"));
            }
            else{
              return Center(child: Text("No data found"));
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}
