import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baby/common/model_data.dart';
import 'package:flutter_baby/common/save_data.dart';
import 'package:flutter_baby/page/common/article_add_widget.dart';
import 'package:flutter_baby/page/main/initialize_items.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: Color(0xFFF695C2),
      ),
      home: MyHome(),
      routes: {
        "article_add" : (context) => YXCArticleAddWidget(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;

  void saveDataToDataBase() async {
    // 存储宝宝类别数据
    await DataBaseHandle.insertCategoryModelList(BabyDataModel.categoryModelList());
    // 存储宝宝喂养篇数据
    await DataBaseHandle.insertArticleModelList(BabyDataModel.feedModelList());
    // 存储宝宝服装数据
    await DataBaseHandle.insertArticleModelList(BabyDataModel.clothingModelList());
    // 宝宝护理篇数据
    await DataBaseHandle.insertArticleModelList(BabyDataModel.nursingModelList());
    // 存储宝宝用品非必备品
    await DataBaseHandle.insertArticleModelList(BabyDataModel.nonEssentialModelList());

    // 存储宝妈类别数据
    await DataBaseHandle.insertCategoryModelList(MomDataModel.categoryModelList());
    // 存储宝妈待产包数据
    await DataBaseHandle.insertArticleModelList(MomDataModel.waitingBagModelList());
  }

  @override
  void initState() {
    super.initState();
    saveDataToDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: bottomBarPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        unselectedItemColor: Color(0xFFBFBFBF),
        selectedItemColor: Color(0xFFF695C2),
        items: bottomBarItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
