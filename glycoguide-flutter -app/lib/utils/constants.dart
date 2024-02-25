import 'package:flutter/material.dart';

TextEditingController passwordTextController = TextEditingController();
TextEditingController emailTextController = TextEditingController();
TextEditingController userNameTextController = TextEditingController();

DateTime now = DateTime.now();
String dayOfWeek = now.weekday == 1
    ? 'Monday'
    : now.weekday == 2
        ? 'Tuesday'
        : now.weekday == 3
            ? 'Wednesday'
            : now.weekday == 4
                ? 'Thursday'
                : now.weekday == 5
                    ? 'Friday'
                    : now.weekday == 6
                        ? 'Saturday'
                        : 'Sunday';
