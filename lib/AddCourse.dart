import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:youtube_video_player/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Addcourse extends StatefulWidget {
  const Addcourse({super.key});

  @override
  State<Addcourse> createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  File? pickedImage;
  TextEditingController courseNameController=TextEditingController();
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
                  controller: courseNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Name"
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  UploadItem();
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF0F4E5B)
                  ),
                  child: Center(child: Text("Add",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

                ),
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

  UploadItem() async {
    if(pickedImage!=null && courseNameController.text!=""){
      String id=randomAlphaNumeric(10);
      FirebaseStorage storage=FirebaseStorage.instanceFor(bucket: "video-player-4b20d.appspot.com");
      TaskSnapshot snapshot= await storage.ref("BlogImages/$id").putFile(pickedImage!);
      String imageurl= await snapshot.ref.getDownloadURL();
      Map<String,dynamic> userinfo={
        "Id": id,
        "Course": courseNameController.text.toString(),
        "Count": 0,
        "Image": imageurl};
       await DatabaseMethods().addCourse(id, userinfo).then((value){
         Fluttertoast.showToast(
             msg: "Course Added Sucessfully",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 16.0
         );
         pickedImage=null;
         courseNameController.text='';
         setState(() {});
       });

    }
  }

}
