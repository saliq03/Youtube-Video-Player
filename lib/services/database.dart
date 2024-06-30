import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
  Future addCourse(String id,Map<String,dynamic> userinfo) async {
   return await FirebaseFirestore.instance
        .collection("Courses")
        .doc(id)
        .set(userinfo);
  }
}