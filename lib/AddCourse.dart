import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addcourse extends StatefulWidget {
  const Addcourse({super.key});

  @override
  State<Addcourse> createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add Course",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Upload the course banner picture",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  PickImage();
                },
                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: pickedImage==null?Icon(Icons.camera_alt_outlined,size: 30,):ClipRRect(borderRadius:BorderRadius.circular(20),child: Image.file(pickedImage!,fit: BoxFit.cover,))
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Course Name",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
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
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF0F4E5B)
                ),
                child: Center(child: Text("Add",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

              )
            ],
          ),
      ),
    );
  }
  PickImage()async{
    try{
      final photo=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(photo==null)return;
      final tempimage=File(photo.path);
      setState(() {
        pickedImage=tempimage;
      });
    }
    catch(ex){
      print("error while picking image");
        print(ex.toString());
    }
  }
}
