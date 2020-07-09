import 'package:flutter_baby/model/article_model.dart';
import 'package:sqflite/sqflite.dart';

/// 数据库操作
class DataBaseHandle {

    // 类别数据库名称
    static final String _categoryDB = "categoryDB.db";
    // 物品数据库名称
    static final String _articleDB = "articleDB.db";
    // 类别栏目表名
    static final String _categoryTableName = "category";
    // 物品数据表名
    static final String _articleTableName = "article";

    /// 获取到数据库路径
    static Future<String> _getDataBasePath(String dbName) async {
        String path = await getDatabasesPath();
        path = "$path/$dbName";
        return path;
    }

    /// 创建并打开类别数据库
    static Future<Database> _openCategoryDatabase() async {
        // 获取到数据库路径
        String path = await _getDataBasePath(_categoryDB);
        // 创建并打开数据库
        Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
             await db.execute('CREATE TABLE $_categoryTableName (categoryId INTEGER PRIMARY KEY, categoryName TEXT)');
        });

        return database;
    }
    
    /// 查询类别表所有数据
    static Future<List<Map<String, dynamic>>> getCategoryAllData() async {
        // 获取到数据库操作对象
        Database database = await _openCategoryDatabase();
        // 查询类别表所有数据
        List<Map<String, dynamic>> list = await database.query(_categoryTableName);
        
        return list;
    }

    /// 查询宝宝类别数据
    static Future<List<Map<String, dynamic>>> getBabyCategoryData() async {
        List<int> categoryIdList = [1, 2, 3, 4, 5];
        String whereString = '';
        for (int i = 0; i < categoryIdList.length; i++) {
            whereString += 'categoryId < ?';
            if (i < categoryIdList.length - 1) {
                whereString += ' OR ';
            }
        }

        // 获取到数据库操作对象
        Database database = await _openCategoryDatabase();
        // 查询宝宝类别数据
        List<Map<String, dynamic>> list = await database.query(_categoryTableName, where: whereString, whereArgs: categoryIdList);

        return list;
    }

    /// 查询宝妈类别数据
    static Future<List<Map<String, dynamic>>> getMomCategoryData() async {
        List<int> categoryIdList = [6];
        String whereString = '';
        for (int i = 0; i < categoryIdList.length; i++) {
            whereString += 'categoryId < ?';
            if (i < categoryIdList.length - 1) {
                whereString += ' OR ';
            }
        }
        // 获取到数据库操作对象
        Database database = await _openCategoryDatabase();
        // 查询宝妈类别数据
        List<Map<String, dynamic>> list = await database.query(_categoryTableName, where: whereString, whereArgs: categoryIdList);

        return list;
    }

    /// 根据某个条件查找类别数据
    static Future<List<Map<String, dynamic>>> getCategoryModel(int categoryId) async {
        // 获取到数据库操作对象
        Database database = await _openCategoryDatabase();
        // 根据 categoryId 查询符合的数据
        List<Map<String, dynamic>> list = await database.query(_categoryTableName, where: 'categoryId = ?', whereArgs: [categoryId]);

        return list;
    }

    /// 插入单个类别数据模型
    static Future<int> insertSimpleCategoryModel(ArticleCategoryModel model) async {
        // 先查询数据库中是否有该数据
        List list = await getCategoryModel(model.categoryId);
        int categoryId = 0;
        if (list.length <= 0) {
            // 插入数据
            // 获取到数据库操作对象
            Database database = await _openCategoryDatabase();
            // 插入数据
            categoryId = await database.insert(_categoryTableName, model.toMap());
        }

        return categoryId;
    }

    /// 批量插入类别数据模型
    static Future<void> insertCategoryModelList(List<ArticleCategoryModel> modelList) async {
        // 获取到数据库操作对象
        Database database = await _openCategoryDatabase();

        for (ArticleCategoryModel model in modelList) {
            // 先查询数据库中是否有该数据
            List<Map<String, dynamic>> list = await database.query(_categoryTableName, where: 'categoryId = ?', whereArgs: ['${model.categoryId}']);
            if (list.length <= 0) {
                await database.insert(_categoryTableName, model.toMap());
            }
        }
    }

    /// 创建并打开物品数据库
    static Future<Database> _openArticleDataBase() async {
        // 获取到数据库路径
        String path = await _getDataBasePath(_articleDB);
        // 创建并打开数据库
        Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
            await db.execute('CREATE TABLE $_articleTableName (articleId INTEGER, name TEXT, count TEXT, desc TEXT, categoryId INTEGER, selected INTEGER)');
        });

        return database;
    }

    /// 查询物品表所有数据
    static Future<List<Map<String, dynamic>>> getArticleAllData() async {
        // 获取到数据库操作对象
        Database database = await _openArticleDataBase();
        // 查询物品表所有数据
        List<Map<String, dynamic>> list = await database.query(_articleTableName);

        return list;
    }

    /// 根据某个条件查找物品数据
    static Future<List<Map<String, dynamic>>> getArticleModel({int articleId, int categoryId}) async {
        // 查询条件语句
        String where = '';
        // 查询条件值
        List<dynamic> whereArgs = [];
        if (articleId != null && articleId > 0) {
            where = 'articleId = ?';
            whereArgs.add(articleId);
        }
        if (categoryId != null && categoryId > 0) {
            if (where.length > 0) {
                where = '$where AND ';
            }
            where = '$where categoryId = ?';
            whereArgs.add(categoryId);
        }

        // 获取到数据库操作对象
        Database database = await _openArticleDataBase();
        // 根据 articleId 查询符合的数据
        List<Map<String, dynamic>> list = await database.query(_articleTableName, where: where, whereArgs: whereArgs);

        return list;
    }

    /// 插入单个物品数据模型
    static Future<int> insertSimpleArticleModel(ArticleModel model) async {
        // 先查询数据库中是否包含该数据
        List list = await getArticleModel(categoryId: model.categoryId, articleId: model.articleId);
        int articleId = 0;
        if (list.length <= 0) {
            // 获取到数据库操作对象
            Database database = await _openArticleDataBase();
            // 插入该数据
            articleId = await database.insert(_articleTableName, model.toMap());
        }

        return articleId;
    }

    /// 批量插入物品数据模型
    static Future<void> insertArticleModelList(List<ArticleModel> modelList) async {
        // 获取到数据库操作对象
        Database database = await _openArticleDataBase();

        for (ArticleModel model in modelList) {
            // 先查询数据库中是否有该数据
            List<Map<String, dynamic>> list = await database.query(_articleTableName, where: 'articleId = ? AND categoryId = ?', whereArgs: ['${model.articleId}', '${model.categoryId}']);
            if (list.length <= 0) {
                await database.insert(_articleTableName, model.toMap());
            }
        }
    }

    /// 根据 categoryId 和 ArticleId 更新数据库
    static Future<void> updateSimpleArticleModel(ArticleModel model) async {
        // 获取到数据库操作对象
        Database database = await _openArticleDataBase();
        // 修改该数据
        int id = await database.update(_articleTableName, model.toMap(), where: 'articleId = ? AND categoryId = ?', whereArgs: [model.articleId, model.categoryId]);

        return id;
    }

    /// 根据 articleId 和 categoryId 删除
    static Future<void> deleteSimpleArticleModel(ArticleModel model) async {
        // 获取到数据库操作对象
        Database database = await _openArticleDataBase();
        // 删除该数据
        database.delete(_articleTableName, where: 'articleId = ? AND categoryId = ?', whereArgs: [model.articleId, model.categoryId]);
    }
}