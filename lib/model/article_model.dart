
/// 物品数据模型
class ArticleModel {
  int articleId; // ID
  String name; // 物品名称
  String count; // 数量
  String desc; // 描述
  int categoryId; // 类别ID 1-喂养篇 2-服装篇 3-护理篇 4-新生儿护肤 5-非必备品 6-宝妈待产包
  int selected; // 是否被选中

  ArticleModel({
    this.articleId,
    this.name,
    this.count,
    this.desc,
    this.categoryId,
    this.selected,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      articleId: json['articleId'] as int,
      name: json['name'] as String,
      count: json['count'] as String,
      desc: json['desc'] as String,
      categoryId: json['categoryId'] as int,
      selected: json['selected'] as int,
    );
  }

  static List<ArticleModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    List<ArticleModel> modelList = [];

    for (Map<String, dynamic> map in jsonList) {
      ArticleModel model = ArticleModel.fromJson(map);
      modelList.add(model);
    }

    return modelList;
  }

  Map<String, dynamic> toMap() {
    return {
      'articleId': articleId,
      'name': name,
      'count': count,
      'desc': desc,
      'categoryId': categoryId,
      'selected': selected,
    };
  }

  @override
  String toString() {
    return "ArticleModel : {"
        "articleId : $articleId, "
        "categoryId : $categoryId, "
        "name : $name, "
        "count : $count, "
        "selected : $selected, "
        "desc : $desc"
        "}\n";
  }
}

/// 类别数据模型
class ArticleCategoryModel {
  final int categoryId; // 类别ID 1-喂养篇 2-服装篇 3-护理篇 4-新生儿护肤 5-非必备品 6-宝妈待产包
  final String categoryName; // 类别名称

  ArticleCategoryModel({
    this.categoryId,
    this.categoryName,
  });

  factory ArticleCategoryModel.formJson(Map<String, dynamic>json) {
    return ArticleCategoryModel(
      categoryId: json["categoryId"] as int,
      categoryName: json["categoryName"] as String,
    );
  }

  static List<ArticleCategoryModel> formJsonList(List<Map<String, dynamic>>jsonList) {
    List<ArticleCategoryModel> modelList = [];
    for (Map<String, dynamic>json in jsonList) {
      ArticleCategoryModel model = ArticleCategoryModel.formJson(json);
      modelList.add(model);
    }

    return modelList;
  }

  Map<String, dynamic> toMap() {
    return {
      "categoryId": this.categoryId,
      "categoryName": this.categoryName,
    };
  }

  @override
  String toString() {
    return "ArticleCategoryModel : {"
        "categoryId : $categoryId, "
        "categoryName : $categoryName, "
        "}\n";
  }
}
