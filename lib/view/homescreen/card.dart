import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modal.dart';

class studentcardWidget extends StatelessWidget {
  final studetmodal student;
  final VoidCallback onDelete;//voidcallback is representing a function that takes no arguments and returns void.
  studentcardWidget(
      {Key ?key, required this.student, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //I use card widget ✔
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.blue,
              onTap:() => SetImage(),
              child: CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 60,
                backgroundImage:  (student.student_image != null) ? FileImage(
                    student.student_image!) : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.camera_alt),
                        ],
                      ),
                    ],
                  ),


              ),
            ),
            Row(
              children: [

                   Container(
                     height: 60,
                     width: 295,
                     child: TextFormField(
                      initialValue: student.student_name,
                      onChanged: (value) {
                        student.student_name = value;
                      },
                      decoration: InputDecoration(labelText: 'STUDENT NAME',),
                                       ),
                   ),

                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.edit),
                  backgroundColor: Colors.blue[100],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: student.student_grid.toString(),//this most valuble initailvalue that tostring;
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      student.student_grid = int.tryParse(value) ?? 0;//if that is no value then in pdf we see amount is 0.0;
                    },
                    decoration: InputDecoration(labelText: 'GR_ID'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: student.student_name,
                    onChanged: (value) {
                      student.student_standard = value;
                    },
                    decoration: InputDecoration(labelText: 'STUDENT STANDARD',),
                  ),
                ),

                FloatingActionButton(
                  child: Icon(Icons.delete),
                  backgroundColor: Colors.blue[100],
                  onPressed: onDelete, //we add function at home screen; by call function ;
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  ImagePicker imagePicker = ImagePicker();


  Future<void> SetImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      student.student_image = File(image!.path);
  }


  }



