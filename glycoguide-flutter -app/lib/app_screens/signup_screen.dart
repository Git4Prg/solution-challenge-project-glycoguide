import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glycoguide/app_screens/profile_details_screen.dart';
import 'package:glycoguide/utils/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:glycoguide/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  CollectionReference users =
                      FirebaseFirestore.instance.collection('Users');
                  users.doc(emailTextController.text).set({
                    'Username': userNameTextController.text,
                    'Email ID': emailTextController.text,
                    'Password': passwordTextController.text,
                    'Monday bloodSugar': '0',
                    'Tuesday bloodSugar': '0',
                    'Wednesday bloodSugar': '0',
                    'Thursday bloodSugar': '0',
                    'Friday bloodSugar': '0',
                    'Saturday bloodSugar': '0',
                    'Sunday bloodSugar': '0',
                  });

                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailTextController.text,
                          password: passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileDetailsScreen()));
                  }).onError((error, stackTrace) {});
                })
              ],
            ),
          ))),
    );
  }
}
