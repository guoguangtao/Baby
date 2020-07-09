import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_baby/common/nodata_widget.dart';
import 'package:flutter_baby/common/save_data.dart';
import 'package:flutter_baby/model/article_model.dart';
import 'package:flutter_baby/page/main/bottom_bar_item.dart';
import 'package:flutter_baby/page/main/configuration.dart';

EventBus eventBus = EventBus();

final String addSuccess = "AddSuccess";

class ArticleListWidget extends StatelessWidget {
  final ArticleCategoryModel model;

  ArticleListWidget({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.categoryName),
        iconTheme: YXCNavigationConfiguration.iconTheme,
        textTheme: YXCNavigationConfiguration.textTheme,
        actions: <Widget>[
          CupertinoButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Future future = Navigator.pushNamed(context, "article_add",
                    arguments: model);
                future.then((value) {
                  if (value) {
                    // 时间传递
                    eventBus.fire(addSuccess);
                  }
                });
              }),
        ],
      ),
      body: ArticleListContent(
        categoryModel: model,
      ),
    );
  }
}

class ArticleListContent extends StatefulWidget {
  final ArticleCategoryModel categoryModel;

  ArticleListContent({@required this.categoryModel});

  @override
  _ArticleListContentState createState() => _ArticleListContentState();
}

class _ArticleListContentState extends State<ArticleListContent> {
  List<ArticleModel> modelList = [];

  @override
  void initState() {
    super.initState();
    _getData();
    // 事件监听
    eventBus.on<String>().listen((event){
      if (event == addSuccess) {
        _getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (modelList == null || modelList.length == 0) return YXCNoDataWidget();

    return ListView.separated(
      itemCount: modelList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = modelList[index];
        return Dismissible(
          key: GlobalObjectKey(item),
          child: YXCArticleListItem(model: modelList[index]),
          background: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: ListTile(
              trailing: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('确定删除?'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            ArticleModel model = modelList[index];
                            modelList.remove(model);
                            DataBaseHandle.deleteSimpleArticleModel(model);
                          },
                          child: Text(
                            "确定",
                            style: TextStyle(color: Colors.red),
                          )),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  );
                });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return YXCDivider();
      },
    );
  }

  void _getData() async {
    List<Map<String, dynamic>> list = await DataBaseHandle.getArticleModel(
        categoryId: widget.categoryModel.categoryId);
    setState(() {
      modelList = ArticleModel.fromJsonList(list);
    });
  }
}
