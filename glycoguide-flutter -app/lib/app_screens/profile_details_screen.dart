import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glycoguide/app_screens/medical_history_screen.dart';
import 'package:glycoguide/utils/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:glycoguide/utils/constants.dart';

class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ProfileDetailsScreen> {
  final nameTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final heightTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final eatingPrefTextController = TextEditingController();
  final lactoseIntoleranceTextController = TextEditingController();
  final glutenIntoleranceTextController = TextEditingController();
  final input6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "User Profile",
          style: TextStyle(
            fontFamily: 'Righteous',
            fontSize: 28,
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: <Widget>[
                userDetailsTextField("Name ", nameTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("Age", ageTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("Gender", genderTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("Height", heightTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("Weight", weightTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("Vegan/Vegetarian/Non-vegetarian",
                    eatingPrefTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField(
                    "Lactose Intolerance", lactoseIntoleranceTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField(
                    "Gluten Intolerance", glutenIntoleranceTextController),
                const SizedBox(
                  height: 20,
                ),
                userDetailsTextField("How often do you exercise?", input6),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Next", () {
                  CollectionReference userDetails =
                      FirebaseFirestore.instance.collection('Users');
                  userDetails.doc(emailTextController.text).update({
                    'Name': nameTextController.text,
                    'Age': ageTextController.text,
                    'Gender': genderTextController.text,
                    'Height': heightTextController.text,
                    'Weight': weightTextController.text,
                    'Eating Preference': eatingPrefTextController.text,
                    'Lactose Intolerance':
                        lactoseIntoleranceTextController.text,
                    'Gluten Intolerance': glutenIntoleranceTextController.text,
                    'Exercise frequency': input6.text,
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicalHistory()));
                })
              ],
            ),
          ))),
    );
  }
}
