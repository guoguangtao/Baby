import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baby/common/save_data.dart';
import 'package:flutter_baby/model/article_model.dart';

class YXCBottomBarItem extends BottomNavigationBarItem {
  static double width = 20;
  static double height = 20;

  YXCBottomBarItem(String imageName, String title)
      : super(
          title: Text(title),
          icon: Image.asset(
            "assets/images/tabbar/$imageName.png",
            width: width,
            height: height,
            gaplessPlayback: true,
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${imageName}_active.png",
            width: width,
            height: height,
            gaplessPlayback: true,
          ),
        );
}

class YXCDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).primaryColor,
      height: 0.3,
      thickness: 0.3,
    );
  }
}

class YXCArticleListItem extends StatefulWidget {
  final ArticleModel model;

  YXCArticleListItem({this.model});

  @override
  _YXCArticleListItemState createState() => _YXCArticleListItemState();
}

class _YXCArticleListItemState extends State<YXCArticleListItem> {
  @override
  Widget build(BuildContext context) {
    String imageName = "assets/images/icon/check_normal.png";

    if (widget.model.selected != null && widget.model.selected == 1) {
      imageName = "assets/images/icon/check_selected.png";
    }

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 3,
                ),
                Image.asset(
                  imageName,
                  width: 20,
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _children(),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          widget.model.selected = widget.model.selected == 1 ? 0 : 1;
          DataBaseHandle.updateSimpleArticleModel(widget.model);
        });
      },
    );
  }

  List<Widget> _children() {
    List<Widget> list = [];

    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: RichText(
                text: TextSpan(
              text: widget.model.name,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.pinkAccent),
            )),
          ),
          Container(
            width: 100,
            alignment: Alignment.topRight,
            child: RichText(
              text: TextSpan(
                text: '数量:',
                style: TextStyle(fontSize: 14.0, color: Colors.pinkAccent),
                children: [
                  TextSpan(
                    text: " ${widget.model.count}",
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    list.add(SizedBox(
      height: 5,
    ));
    if (widget.model.desc != null) {
      list.add(Text(
        widget.model.desc,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 14.0, color: Colors.black),
      ));
    }

    return list;
  }
}
