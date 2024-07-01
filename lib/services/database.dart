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

<<<<<<< HEAD
  Future UpdataCount(String id,int count) async {
    print("inside update count");
    print(count);
=======
  Future UpdataCount(String id,String count) async {
>>>>>>> 3883744e975163a85fbe378e3a9045a3e8dce843
    return await FirebaseFirestore.instance
    .collection("Courses")
    .doc(id)
    .update({
      "Count": count
    });
  }
}