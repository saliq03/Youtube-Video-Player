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
