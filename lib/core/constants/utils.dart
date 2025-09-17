import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homies_app/core/themes/color_manager.dart';
import 'package:logger/logger.dart';

class Utils {}

// PAR ceci :
logMsg(String? message, {bool? error}) {
  if (kDebugMode) {
    final safeMessage = message ?? 'Null message';
    if (error ?? false) {
      print('ERROR: $safeMessage');
    } else {
      print('INFO: $safeMessage');
    }
  }
}

String constructPathFile(String path, String filename) {
  return path + Platform.pathSeparator + filename;
}

int countWorkDaysFromStartMonthToNow() {
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  int count = 0;
  for (int i = 0; i < now.day; i++) {
    final date = startOfMonth.add(Duration(days: i));
    if (date.weekday >= 1 && date.weekday <= 5) {
      count++;
    }
  }
  return count;
}

DateTime getFirstDayOfThisMonth() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 1);
}

DateTime getLastDayOfThisMonth() {
  final now = DateTime.now();
  return DateTime(now.year, now.month + 1, 0);
}

bool isDateInCurrentMonth(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year && date.month == now.month;
}

DateTime getMondayFromDateTime(DateTime date) {
  // Calculate the difference between the provided date's weekday and Monday (1).
  // Subtracting this difference from the provided date will give us the first day of the week (Monday).
  final int difference = date.weekday - DateTime.monday;

  // Subtract the difference to get the first day of the week.
  DateTime firstDayOfWeek = date.subtract(Duration(days: difference));

  // Set the time to 00:00:00
  firstDayOfWeek = DateTime(firstDayOfWeek.year, firstDayOfWeek.month, firstDayOfWeek.day, 0, 0, 0);

  return firstDayOfWeek;
}

Color getPotentielBackground(String potentiel) {
  switch (potentiel) {
    case "A+":
    case "A":
      return Colors.greenAccent.shade700;
    case "B+":
    case "B":
      return Colors.orange.shade800;
    case "C+":
    case "C":
      return Colors.red.shade500;
    case "VIP":
      return ColorManager.blue_dark;

    default:
      return Colors.transparent;
  }
}

Color getColorStatusVisite(String status) {
  switch (status) {
    case "PLANIFIEE":
      return ColorManager.primary;
    case "REALISEE":
      return Colors.green.shade800;
    case "ANNULEE":
      return Colors.red.shade900;

    default:
      return ColorManager.primary;
  }
}

Color parseColor(String colorString) {
  // Remove the '#' character if it exists
  if (colorString.startsWith('#')) {
    colorString = colorString.substring(1);
  }

  // Check if the string is a valid color string (6 or 8 characters long)
  if (colorString.length != 6 && colorString.length != 8) {
    logMsg("Invalid color string: $colorString");
    return Colors.white;
  }

  // Parse the red, green, blue, and alpha components
  int red = int.parse(colorString.substring(0, 2), radix: 16);
  int green = int.parse(colorString.substring(2, 4), radix: 16);
  int blue = int.parse(colorString.substring(4, 6), radix: 16);

  // Check if there is an alpha component, and if so, parse it
  int alpha = 255; // Default alpha value
  if (colorString.length == 8) {
    alpha = int.parse(colorString.substring(6, 8), radix: 16);
  }

  // Create and return the Color object
  return Color.fromARGB(alpha, red, green, blue);
}

DateTime subtractOneMonth(DateTime date) {
  int currentMonth = date.month;
  int currentYear = date.year;

  if (currentMonth == 1) {
    // If it's January, subtract one year and set the month to December (12)
    return DateTime(
        currentYear - 1, 12, date.day, date.hour, date.minute, date.second, date.millisecond, date.microsecond);
  } else {
    // Subtract one month while handling varying month lengths
    int previousMonth = currentMonth - 1;
    int daysInPreviousMonth = DateTime(currentYear, previousMonth + 1, 0).day;
    int previousDay = date.day <= daysInPreviousMonth ? date.day : daysInPreviousMonth;

    return DateTime(currentYear, previousMonth, previousDay, date.hour, date.minute, date.second, date.millisecond,
        date.microsecond);
  }
}

DateTime getFirstDayOfPreviousMonth(int numberOfMonthsAgo) {
  DateTime currentDate = DateTime.now();

  // Calculate the target month
  int targetMonth = currentDate.month - numberOfMonthsAgo;
  int targetYear = currentDate.year;

  // Handle cases where we need to go back to the previous year
  if (targetMonth <= 0) {
    targetMonth += 12;
    targetYear -= 1;
  }

  // Create a DateTime object for the first day of the target month
  DateTime firstDayOfTargetMonth = DateTime(targetYear, targetMonth, 1);

  return firstDayOfTargetMonth;
}

List<DateTime> getLast8Weeks() {
  DateTime currentDate = DateTime.now();
  List<DateTime> last8Weeks = [];

  for (int i = 0; i < 8; i++) {
    last8Weeks.add(currentDate.subtract(Duration(days: i * 7)));
  }

  return last8Weeks.toList();
}

int getCurrentWeekNumber(DateTime currentDate) {
  DateTime januaryFourth = DateTime(currentDate.year, 1, 4);
  DateTime firstMonday = januaryFourth.subtract(Duration(days: januaryFourth.weekday - 1));

  int days = currentDate.difference(firstMonday).inDays;
  int currentWeekNumber = (days / 7).floor() + 1;

  return currentWeekNumber;
}

DateTime getFirstDayOfWeek(DateTime date) {
  int daysUntilMonday = (date.weekday - 1) % 7; // Calculate days until Monday (0 for Monday, 1 for Tuesday, ...)
  DateTime monday = date.subtract(Duration(days: daysUntilMonday));
  return monday;
}

String removeOuterQuotes(String src) {
  if (src.startsWith('"') && src.endsWith('"')) {
    // Remove the outer quotes
    src = src.substring(1, src.length - 1);

    // Remove the space inside the quotes using regular expression
    src = src.replaceAll(RegExp(r'\s'), '');
  }

  return src;
}

Future<List<dynamic>> readJson(String filePath) async {
  try {
    String jsonData = await rootBundle.loadString(filePath);
    return jsonDecode(jsonData);
  } catch (e) {
    debugPrint('Error reading JSON: $e');
    return List.empty();
  }
}

/*Future<List<List<dynamic>>> importXmlFile() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["csv"]);

  // if no file is picked
  if (result == null) return List.empty();
  // we will log the name, size and path of the
  // first picked file (if multiple are selected)
  debugPrint(result.files.first.name);

  final content = await utf8.decodeStream(result.files.first.readStream!);

  // Split lines and remove empty ones
  List<String> lines = content.split('\n').where((line) => line.isNotEmpty).toList();

  // Remove the header line if present
  lines = lines.sublist(1);

  return lines.map((line) {
    List<dynamic> cells = line.split(';');

    return cells.map((e) {
      //debugPrint(e.toString().trim());
      return e.trim();
    }).toList();
  }).toList();
}*/

/*
Future<dynamic> importJsonFile() async {
  final result = await FilePicker.platform
      .pickFiles(allowMultiple: false, allowedExtensions: ["json"], type: FileType.custom, withReadStream: true);

  if (result == null) return List.empty();

  debugPrint("importJsonFile named => ${result.files.first.name}");

  // If you want to handle the case where the file picked is not a JSON file:
  if (result.files.isEmpty || result.files.first.extension != "json") {
    // You can show an error message or return an error state here.
    return List.empty();
  }

  // Decode the JSON content from the file and return it.
  try {
    final content = await utf8.decodeStream(result.files.first.readStream!);

    return jsonDecode(content);
  } catch (e) {
    // Handle any errors that might occur during JSON decoding.
    debugPrint("Error decoding JSON: $e");
    return List.empty();
  }
}*/