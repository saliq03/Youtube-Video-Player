
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_video_player/All_videos.dart';

class Homestreambuilder extends StatefulWidget {
  const Homestreambuilder({super.key});

  @override
  State<Homestreambuilder> createState() => _HomestreambuilderState();
}

class _HomestreambuilderState extends State<Homestreambuilder> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                  DocumentSnapshot ds=snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllVideos(title: ds["Course"], image: ds["Image"])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(ds["Image"],fit: BoxFit.cover,height: 150,width: 140,)),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              SizedBox(width: 200,child: Center(child: Text(ds["Course"],style: TextStyle(fontFamily: "Poppins",fontSize: 22,fontWeight: FontWeight.bold),))),
                              SizedBox(height: 10,),
                              Text("(${ds["Count"]} Videos)",style: TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: 20),)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
              }
              else if(snapshot.hasError){
                print("Error:");
                print(snapshot.hasError);
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
        });
  }
}
