




import 'package:flutter/material.dart';

class ProfileListModel {
  String? title;
  String? iconPath;
  String? desc;
  VoidCallback? onTap;
  bool isLast;
  bool isFirst;
  ProfileListModel(
      {this.title,
        this.iconPath,
        this.desc,
        this.onTap,
        this.isFirst = false,
        this.isLast = false});
}