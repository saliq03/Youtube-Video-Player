import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
  Future addCourse(String id,Map<String,dynamic> userinfo) async {
   return await FirebaseFirestore.instance
        .collection("Courses")
        .doc(id)
        .set(userinfo);
  }

  Future addVideo(String id,String link,String image) async {
    return await FirebaseFirestore.instance
        .collection("Courses")
        .doc(id)
        .collection("Videos")
        .add({
      "Link": link,
      "Image":image
    });
  }

  Future UpdataCount(String id,String count) async {
    return await FirebaseFirestore.instance
    .collection("Courses")
    .doc(id)
    .update({
      "Count": count
    });
  }
}