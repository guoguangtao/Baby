import 'package:flutter/material.dart';
import 'package:flutter_baby/common/save_data.dart';
import 'package:flutter_baby/model/article_model.dart';
import 'package:flutter_baby/page/main/bottom_bar_item.dart';
import 'package:flutter_baby/page/main/configuration.dart';
import 'package:toast/toast.dart';

/// 添加物品
class YXCArticleAddWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取到从上一层传递过来的数据模型
    ArticleCategoryModel model = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("添加物品"),
        iconTheme: YXCNavigationConfiguration.iconTheme,
        textTheme: YXCNavigationConfiguration.textTheme,
      ),
      body: _YXCContent(categoryModel: model),
    );
  }
}

class _YXCContent extends StatefulWidget {
  final ArticleCategoryModel categoryModel;

  _YXCContent({@required this.categoryModel});

  @override
  __YXCContentState createState() => __YXCContentState();
}

class __YXCContentState extends State<_YXCContent> {
  List<Widget> contents = [];
  bool selected = false;
  ArticleModel model = ArticleModel();

  void setupModel() async {
    // 设置类别id
    model.categoryId = widget.categoryModel.categoryId;
    // 设置articleId
    List<Map<String, dynamic>> list = await DataBaseHandle.getArticleModel(
        categoryId: widget.categoryModel.categoryId);
    List<ArticleModel> modelList = ArticleModel.fromJsonList(list);
    if (modelList == null) {
      model.articleId = 1;
    } else if (modelList.length == 0) {
      model.articleId = 1;
    } else if (modelList.length > 0) {
      model.articleId = modelList.last.articleId + 1;
    }
    model.selected = 0;
  }

  @override
  void initState() {
    super.initState();

    setupModel();

    // 物品名称
    contents.add(_BuildContentItem(
      title: "物品名称",
      onChanged: (String string) {
        model.name = string;
      },
    ));
    // 物品数量
    contents.add(_BuildContentItem(
      title: "物品数量",
      onChanged: (String string) {
        model.count = string;
      },
    ));
    // 物品描述
    contents.add(_BuildContentItem(
      title: "物品描述",
      onChanged: (String string) {
        model.desc = string;
      },
    ));
    // 是否已经购买
    contents.add(_BuildContentHasBuy(
      title: "是否购买",
      selected: selected,
      onChanged: (bool newValue) {
        setState(() {
          selected = newValue;
          model.selected = newValue == true ? 1 : 0;
        });
      },
    ));

    // 间距
    contents.add(SizedBox(
      height: 30,
    ));

    // 保存按钮
    contents.add(_BuildSaveButton(
      onTap: () {
        Future future = DataBaseHandle.insertSimpleArticleModel(model);
        future.then((value) {
          int articleId = value;
          if (articleId != null && articleId > 0) {
            Toast.show('已保存', context);
            Future.delayed(Duration(seconds: 2), (){
              if (Navigator.canPop(context)) {
                Navigator.pop(context, true);
              }
            });
          }
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return contents[index];
        });
  }
}

/// 添加物品界面item
class _BuildContentItem extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChanged;

  const _BuildContentItem({
    Key key,
    this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15),
                constraints: BoxConstraints.tightForFinite(),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16.0, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Theme.of(context).primaryColor, width: 0.25),
                  ),
                ),
                child: TextField(
                  maxLines: null,
                  controller: TextEditingController(),
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        YXCDivider(),
      ],
    );
  }
}

/// 是否购买了该物品
// ignore: must_be_immutable
class _BuildContentHasBuy extends StatefulWidget {
  final String title;
  bool selected;
  final ValueChanged<bool> onChanged;

  _BuildContentHasBuy({
    this.title,
    this.onChanged,
    this.selected = false,
  });

  @override
  __BuildContentHasBuyState createState() => __BuildContentHasBuyState();
}

/// 是否购买该商品
class __BuildContentHasBuyState extends State<_BuildContentHasBuy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15),
                constraints: BoxConstraints.tightForFinite(),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16.0, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                constraints: BoxConstraints.tightForFinite(),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Theme.of(context).primaryColor, width: 0.25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Switch(
                        value: widget.selected,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            widget.selected = newValue;
                          });
                          if (widget.onChanged != null) {
                            widget.onChanged(newValue);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
        YXCDivider(),
      ],
    );
  }
}

/// 保存
class _BuildSaveButton extends StatelessWidget {
  final GestureTapCallback onTap;

  _BuildSaveButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        height: 50,
        child: Text(
          '保存',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
