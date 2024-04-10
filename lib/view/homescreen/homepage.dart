import 'package:flutter/material.dart';

import '../modal.dart';
import 'card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<studetmodal> studentlist = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },

          ),
        ],
      ),
      body: Center(
        child: (studentlist != null)?
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: studentlist.length,
                itemBuilder: (context, index) {
                  return studentcardWidget(
                    student: studentlist[index],
                    onDelete: () {
                      setState(() {
                        studentlist.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                FloatingActionButton(
                    backgroundColor:  Colors.blue,
                    onPressed: () {
                      setState(() {
                        studentlist.add(studetmodal());//add  call model class and object that add in item list;
                      });
                    },
                    child: Icon(Icons.person_add_outlined),),
                SizedBox(width: 260),
                  FloatingActionButton(
                    onPressed: () {

                    },
                    child: Icon(Icons.edit),
                    backgroundColor: Colors.blue,
                  ),
              ],
            ),
            SizedBox(height: 20),

          ],
        )
            :Text('No student\'s available.'),
      ),
    );
  }
}