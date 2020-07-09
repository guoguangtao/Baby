
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baby/common/model_data.dart';
import 'package:flutter_baby/model/article_model.dart';
import 'package:flutter_baby/page/common/article_list_widget.dart';
import 'package:flutter_baby/page/main/bottom_bar_item.dart';
import 'package:flutter_baby/page/main/configuration.dart';

class BabyMomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("宝妈用品", style: YXCNavigationConfiguration.titleStyle),),
      body: YXCBabyMomPageContent(),
    );
  }
}

class YXCBabyMomPageContent extends StatefulWidget {
  @override
  _YXCBabyMomPageContentState createState() => _YXCBabyMomPageContentState();
}

class _YXCBabyMomPageContentState extends State<YXCBabyMomPageContent> {

  List<ArticleCategoryModel> contentList = MomDataModel.categoryModelList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            child: Text("${contentList[index].categoryName}", style: TextStyle(fontSize: 17.0),),
            color: Colors.transparent,
            height: 40,
            width: double.minPositive,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return ArticleListWidget(model: contentList[index],);
            }));
          },
        );
      },
      separatorBuilder: (context, index) {
        return YXCDivider();
      },
      itemCount: contentList.length,
    );
  }
}

