import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glycoguide/app_screens/homepage_screen.dart';
import 'package:glycoguide/app_screens/signin_screen.dart';
import 'package:glycoguide/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          String age = snapshot.data!.get('Age');
          String gender = snapshot.data!.get('Gender');
          String height = snapshot.data!.get('Height');
          String weight = snapshot.data!.get('Weight');
          String eatingPref = snapshot.data!.get('Eating Preference');
          String lactoseIntolerance = snapshot.data!.get('Lactose Intolerance');
          String glutenIntolerance = snapshot.data!.get('Gluten Intolerance');
          String exerciseFrequency = snapshot.data!.get('Exercise frequency');
          String diagnosisDate = snapshot.data!.get('Date of Diagnosis');
          String heartDisease = snapshot.data!.get('Heart Disease');
          String otherComplications = snapshot.data!.get('Other Complications');

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "profile",
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 65.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        _BarChart();
                      },
                    );
                  },
                  icon: Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  icon: const Icon(Icons.logout_outlined),
                  iconSize: 30.0,
                  color: Colors.white,
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: $name',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Age: $age',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Gender: $gender',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Height: $height',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Weight: $weight',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Dietary Preference: $eatingPref',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Lactose Intolerance: $lactoseIntolerance',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Gluten Intolerance: $glutenIntolerance',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Exercise Frequency: $exerciseFrequency',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Medical History',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      color: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Diagnosis: $diagnosisDate',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Heart Disease: $heartDisease',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Other Complications: $otherComplications',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Fasting Blood Sugar Level',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: _BarChart(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _BarChart extends StatefulWidget {
  _BarChart();

  @override
  State<_BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<_BarChart> {
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

          double monBloodSugar = snapshot.data!.get('Monday bloodSugar') != null
              ? double.parse(snapshot.data!.get('Monday bloodSugar'))
              : 0;
          double tueBloodSugar =
              snapshot.data!.get('Tuesday bloodSugar') != null
                  ? double.parse(snapshot.data!.get('Tuesday bloodSugar'))
                  : 0;
          double wedBloodSugar =
              snapshot.data!.get('Wednesday bloodSugar') != null
                  ? double.parse(snapshot.data!.get('Wednesday bloodSugar'))
                  : 0;
          double thuBloodSugar =
              snapshot.data!.get('Thursday bloodSugar') != null
                  ? double.parse(snapshot.data!.get('Thursday bloodSugar'))
                  : 0;
          double friBloodSugar = snapshot.data!.get('Friday bloodSugar') != null
              ? double.parse(snapshot.data!.get('Friday bloodSugar'))
              : 0;
          double satBloodSugar =
              snapshot.data!.get('Saturday bloodSugar') != null
                  ? double.parse(snapshot.data!.get('Saturday bloodSugar'))
                  : 0;
          double sunBloodSugar = snapshot.data!.get('Sunday bloodSugar') != null
              ? double.parse(snapshot.data!.get('Sunday bloodSugar'))
              : 0;
          return BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: barGroups(
                monBloodSugar,
                tueBloodSugar,
                wedBloodSugar,
                thuBloodSugar,
                friBloodSugar,
                satBloodSugar,
                sunBloodSugar,
              ),
              gridData: const FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              // maxY: 20,
            ),
          );
        });
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  //
  List<BarChartGroupData> barGroups(
    double monBloodSugar,
    double tueBloodSugar,
    double wedBloodSugar,
    double thuBloodSugar,
    double friBloodSugar,
    double satBloodSugar,
    double sunBloodSugar,
  ) {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 97,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 104,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 108,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 123,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 130,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: 177,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: 158,
            color: Colors.white,
            width: 15,
          )
        ],
        showingTooltipIndicators: [0],
      ),
    ];
  }
}
