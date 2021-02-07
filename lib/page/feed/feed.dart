import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baby/page/main/configuration.dart';

class BabyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "喂养",
          style: YXCNavigationConfiguration.titleStyle,
        ),
        actions: [
          CupertinoButton(
            child: Icon(
              Icons.history_toggle_off,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BabyFeedContent(),
    );
  }
}

class BabyFeedContent extends StatefulWidget {
  @override
  _BabyFeedContentState createState() => _BabyFeedContentState();
}

class _BabyFeedContentState extends State<BabyFeedContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
