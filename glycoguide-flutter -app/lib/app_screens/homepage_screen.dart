import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:glycoguide/api.dart';
import 'package:flutter/material.dart';
import 'package:glycoguide/app_screens/navbar_screen.dart';
import 'package:glycoguide/app_screens/profile_page.dart';
import 'package:glycoguide/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  String glycoguide = '';
  Dio dio = Dio();
  PlatformFile? pickedFile;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(emailTextController.text)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          String name = snapshot.data!.get('Name');
          return Scaffold(
            drawer: const NavBar(),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                "glyco guide",
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 65,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: () {
                    showDoubleInputDialog(context);
                  },
                  icon: const Icon(
                    Icons.edit_note_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 30.0,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.person_sharp,
                    color: Colors.white,
                  ),
                  iconSize: 30.0,
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: FutureBuilder<String>(
                      future: fetchData(textEditingController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data ?? '',
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              fillColor: Colors.white,
                              hintText: "Enter the name of a food item",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor))),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () async {
                          if (textEditingController.text.isNotEmpty) {
                            String text = textEditingController.text;
                            String result = await fetchData(text);

                            setState(() {});
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade800,
                          child: const Center(
                            child: Icon(Icons.send, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showDoubleInputDialog(BuildContext context) {
    TextEditingController bloodSugarController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Hi Manoj,',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
          ),
          content: TextField(
            autofocus: true,
            controller: bloodSugarController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              hintText: 'Enter your Fasting Blood Sugar',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 15,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                double? inputValue = double.tryParse(bloodSugarController.text);
                if (inputValue != null && dayOfWeek == 'Monday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Monday bloodSugar ': bloodSugarController.text,
                  });
                  setState(() {});
                }
                if (inputValue != null && dayOfWeek == 'Tuesday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Tuesday bloodSugar ': bloodSugarController.text,
                  });
                  setState(() {});
                }
                if (inputValue != null && dayOfWeek == 'Wednesday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Wednesday bloodSugar ': bloodSugarController.text,
                  });
                }
                if (inputValue != null && dayOfWeek == 'Thursday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Thursday bloodSugar ': bloodSugarController.text,
                  });
                }
                if (inputValue != null && dayOfWeek == 'Friday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Friday bloodSugar ': bloodSugarController.text,
                  });
                }
                if (inputValue != null && dayOfWeek == 'Saturday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Saturday bloodSugar ': bloodSugarController.text,
                  });
                }
                if (inputValue != null && dayOfWeek == 'Sunday') {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Sunday bloodSugar ': bloodSugarController.text,
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
