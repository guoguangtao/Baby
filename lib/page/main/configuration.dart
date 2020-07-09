import 'package:flutter/material.dart';

class YXCNavigationConfiguration {
  /// 标题样式
  static TextStyle titleStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
  );

  /// 导航栏标题样式
  static TextTheme textTheme = TextTheme(
    title: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  /// 导航栏icon样式
  static IconThemeData iconTheme = IconThemeData(
    color: Colors.white,
  );
}
