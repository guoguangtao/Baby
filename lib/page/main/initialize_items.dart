import 'package:flutter/material.dart';
import 'package:flutter_baby/page/baby/baby.dart';
import 'package:flutter_baby/page/baby_mom/baby_mom.dart';
import 'package:flutter_baby/page/feed/feed.dart';

import 'bottom_bar_item.dart';

List<Widget> bottomBarPages = [
  BabyPage(),
  BabyMomPage(),
  BabyFeed(),
];

List<YXCBottomBarItem> bottomBarItems = [
  YXCBottomBarItem("baby", "宝宝"),
  YXCBottomBarItem("mother", "宝妈"),
  YXCBottomBarItem("feeder", "喂养"),
];
