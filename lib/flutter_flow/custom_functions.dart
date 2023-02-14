import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String makeUpperCase(String stringInput) {
  // Add your function code here!
  return stringInput
      .toUpperCase(); //this part of code will make to text to uppercase!
}

int getCount(List<int>? collection) {
  // Add your function code here!
  int total = 0;
  for (int? i in collection!) {
    total += i!;
  }
  return total;
}

DateTime? futureDate(
  DateTime? startDate,
  int? minutes,
  int? seconds,
  int? hours,
  int? days,
) {
  // create a new variable for the result
  DateTime result;

  // set initial value from startDate input parameter.
  //If startDate is null then use current Timestamp as StartDate
  result = startDate ?? (DateTime.now());

  // null saftey checks for all input parameters
  int addMinutes = 0 + (minutes ?? 0);
  int addSeconds = 0 + (seconds ?? 0);
  int addHours = 0 + (hours ?? 0);
  int addDays = 0 + (days ?? 0);

//calculate future date by adding all input durations to the StartDate stored in result variable

  result = result.add(Duration(
      seconds: addSeconds,
      minutes: addMinutes,
      hours: addHours,
      days: addDays));

//return final result with the future date

  return result;
}

int rand() {
  var t;
  var rng = math.Random();
  for (var i = 10000; i < 100000; i++) {
    t = rng.nextInt(100000);
  }
  return t;
}

String? ddmmyyFormat(String? datePick) {
  DateFormat inputFormat = DateFormat("yMd");
  DateFormat outputFormat = DateFormat("dd-MM-yyyy");
  DateFormat fullOutputFormat = DateFormat("dd-MM-yyyy");
  DateTime date = inputFormat.parse(datePick!);
  var dateString = outputFormat.format(date);
  var dateTimeString = fullOutputFormat.format(date);
  print("Formatted date : $dateTimeString");
  return dateTimeString;
}
