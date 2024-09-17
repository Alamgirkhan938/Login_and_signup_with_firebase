import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Utils/utils.dart';
import 'package:untitled1/Widget/custom_textbutton.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();

  bool loading=false;
  // create table reference
  final databaseRef=FirebaseDatabase.instance.ref('Assignments');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter Title',border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(

                  hintText: 'Enter Description',border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            CustomTextbutton(text: "Save",loading: loading, onpressed:(){
              setState(() {
                loading=true;
              });
              databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                'title':titleController.text.toString(),
                'description':descriptionController.text.toString(),

              }).then((alam){
                Utils().fluttertoast('Saved Successfully');
                setState(() {
                  loading=false;
                });
              }).onError((error,stackTrace){
                Utils().fluttertoast(error.toString());
                setState(() {
                  loading=false;
                });
              });
            }),

          ],
        ),
      ),
    );
  }
}
