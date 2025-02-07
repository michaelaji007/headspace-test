



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTime(String? dateTime) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  if (dateTime == null) {
    return formatter.format(DateTime.now());
  }

  try {
    final parsedDate = DateTime.parse(dateTime);
    return formatter.format(parsedDate);
  } catch (e) {
    return 'Invalid date';
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}


extension XLanguageName on Locale {
  String get languageName {
    switch (languageCode.toLowerCase()) {
      case 'es':
        return 'Spanish';
      case 'en':
        return 'English';
      default:
        return languageCode;
    }
  }
}

extension ThemeColor on ThemeMode {
  Color get color {
    switch (this) {
      case ThemeMode.system:
        return Colors.black;
      case ThemeMode.dark:
        return Colors.black;
      case ThemeMode.light:
        return Colors.grey;
      default:
        return Colors.red;
    }
  }
}

String formatTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} '
      '${dateTime.hour.toString().padLeft(2, '0')}:'
      '${dateTime.minute.toString().padLeft(2, '0')}';
}