import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homestreambuilder extends StatefulWidget {
  const Homestreambuilder({super.key});

  @override
  State<Homestreambuilder> createState() => _HomestreambuilderState();
}

class _HomestreambuilderState extends State<Homestreambuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return ListView.builder(itemBuilder: (context,index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/images/sample.png",fit: BoxFit.cover,height: 150,width: 140,)),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          SizedBox(width: 200,child: Text("${snapshot.data!.docs[index]["Course"]}",style: TextStyle(fontFamily: "Poppins",fontSize: 22,fontWeight: FontWeight.bold),)),
                          SizedBox(height: 10,),
                          Text("(8 Videos)",style: TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: 20),)
                        ],
                      )
                    ],
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
        }

      ),
    );
  }
}
