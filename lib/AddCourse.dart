import 'package:flutter/material.dart';

class Addcourse extends StatefulWidget {
  const Addcourse({super.key});

  @override
  State<Addcourse> createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add Course",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Upload the course banner picture",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
              SizedBox(height: 20,),
              Center(
                child: Material(
                  elevation: 5,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.camera_alt_outlined,size: 30,),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Course Name",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Name"
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green
                ),
                child: Center(child: Text("Add",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

              )
            ],
          ),
      ),
    );
  }
}
