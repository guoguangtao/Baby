
import 'package:flutter_baby/common/data.dart';
import 'package:flutter_baby/model/article_model.dart';

/// 宝宝模型数据
class BabyDataModel {

    /// 宝宝用品分类数据
    static List<ArticleCategoryModel> categoryModelList() {
        return ArticleCategoryModel.formJsonList(BabyData.categoryData());
    }

    /// 宝宝喂养篇数据
    static List<ArticleModel> feedModelList() {
        return ArticleModel.fromJsonList(BabyData.listFeedData());
    }

    /// 宝宝服装篇数据
    static List<ArticleModel> clothingModelList() {
        return ArticleModel.fromJsonList(BabyData.listClothingData());
    }

    /// 宝宝护理篇数据
    static List<ArticleModel> nursingModelList() {
        return ArticleModel.fromJsonList(BabyData.listNursingData());
    }

    /// 宝宝用品非必备品
    static List<ArticleModel> nonEssentialModelList() {
        return ArticleModel.fromJsonList(BabyData.listNonEssentialData());
    }
}

/// 宝妈模型数据
class MomDataModel {

    /// 宝妈用品分类数据
    static List<ArticleCategoryModel> categoryModelList() {
        return ArticleCategoryModel.formJsonList(MomData.categoryData());
    }

    /// 宝妈待产包数据
    static List<ArticleModel> waitingBagModelList() {
        return ArticleModel.fromJsonList(MomData.listWaitingBag());
    }
}