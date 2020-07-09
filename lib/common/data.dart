/// 宝宝数据
class BabyData {
  /// 宝宝用品类别数据
  static List<Map<String, dynamic>> categoryData() {
    // 类别ID 1-喂养篇 2-服装篇 3-护理篇 4-新生儿护肤 5-非必备品
    return <Map<String, dynamic>>[
      _getCategoryMap(categoryId: 1, categoryName: "喂养篇"),
      _getCategoryMap(categoryId: 2, categoryName: "服装篇"),
      _getCategoryMap(categoryId: 3, categoryName: "护理篇"),
      _getCategoryMap(categoryId: 4, categoryName: "新生儿护肤"),
      _getCategoryMap(categoryId: 5, categoryName: "非必备品"),
    ];
  }

  static Map<String, dynamic> _getCategoryMap(
      {int categoryId, String categoryName}) {
    return {"categoryId": categoryId, "categoryName": categoryName};
  }


  /// 宝宝喂养篇用品数据
  static List<Map<String, dynamic>> listFeedData() {
    return <Map<String, dynamic>>[
      _getArticleModel(1, "奶瓶", "1个", 1),
      _getArticleModel(2, "奶瓶清洗剂", "1瓶", 1),
      _getArticleModel(3, "奶瓶刷", "1个", 1),
      _getArticleModel(4, "奶粉", "1罐", 1, desc: "不清楚产后母乳情况建议先备一瓶小份，根据宝宝出生后再进行购买"),
      _getArticleModel(5, "软勺+碗", "1副", 1, desc: "刚生完宝宝，还没有母乳，有的医院会让用勺子喂养水或者奶粉，尽量先不使用奶瓶"),
      _getArticleModel(6, "保温杯", "1个", 1, desc: "存放泡奶粉的温水，宝妈产后要喝温水也可以用到"),
    ];
  }


  /// 宝宝服装篇用品数据
  static List<Map<String, dynamic>> listClothingData() {
    return <Map<String, dynamic>>[
      _getArticleModel(1, "纸尿裤", "1包", 2, desc: "新生儿nb一包"),
      _getArticleModel(2, "包被", "1条", 2, desc: "出生当被子，出院防风"),
      _getArticleModel(3, "衣服", "2-3套", 2, desc: "和尚服准备 2-3 套分别 52 码 59 码多备点，可以穿到 3 个月（有纽扣、系绳子的为主）"),
      _getArticleModel(4, "胎帽", "2-3顶", 2, desc: "根据个人喜爱购买数量"),
      _getArticleModel(5, "袜子", "若干", 2, desc: "夏天的宝宝尽量先购买网状的"),
      _getArticleModel(6, "肚围", "2个", 2),
    ];
  }


  /// 宝宝护理篇用品数据
  static List<Map<String, dynamic>> listNursingData() {
    return <Map<String, dynamic>>[
      _getArticleModel(1, "隔尿垫", "不限", 3, desc: "防止宝宝大小便弄湿被子，清洗宝宝大小便垫在下面"),
      _getArticleModel(2, "护臀霜", "1盒", 3, desc: "新生儿宝宝容易红屁屁"),
      _getArticleModel(3, "棉签", "不限", 3, desc: "清理宝宝眼屎鼻屎，推进贝亲螺旋头棉签"),
      _getArticleModel(4, "爽身粉", "若干", 3, desc: "推荐液体爽身粉，粉状飞粉容易进入口鼻"),
      _getArticleModel(5, "耳温计", "1个", 3, desc: "看个人需求购买"),
      _getArticleModel(6, "毛巾", "3-4块", 3, desc: "宝宝擦嘴、擦水、洗脸、洗屁股等专用，3-4块纱布方巾"),
      _getArticleModel(7, "浴巾", "2件", 3, desc: "洗澡专用，六层纱布浴巾最好"),
      _getArticleModel(8, "脸盘", "最少2个", 3, desc: "宝宝专用，最少2个，洗脸洗屁屁"),
      _getArticleModel(9, "婴儿湿巾", "若干", 3),
      _getArticleModel(10, "棉柔巾", "若干", 3),
      _getArticleModel(11, "浴盆", "1个", 3, desc: "根据需求购买，选择有托浮力的，在购买一个托浮垫"),
      _getArticleModel(12, "婴儿车", "1个", 3, desc: "看自己喜好需求购买"),
      _getArticleModel(13, "婴儿床", "1个", 3, desc: "看自己喜好需求购买"),
      _getArticleModel(14, "痱子水", "1", 3),
      _getArticleModel(15, "婴儿沐浴露", "1", 3),
    ];
  }


  /// 宝宝非必备品数据
  static List<Map<String, dynamic>> listNonEssentialData() {
    return <Map<String, dynamic>>[
      _getArticleModel(1, "恒温壶", "1个", 5),
      _getArticleModel(2, "温奶器", "1个", 5),
      _getArticleModel(3, "水温计", "1个", 5),
      _getArticleModel(4, "婴儿专用柜", "1个", 5),
      _getArticleModel(5, "专用衣架", "若干", 5),
      _getArticleModel(6, "专用迷你洗衣机", "1个", 5),
      _getArticleModel(7, "婴儿指甲剪套装", "1副", 5),
      _getArticleModel(8, "空气净化器", "1台", 5),
      _getArticleModel(9, "婴儿用品消毒柜", "1个", 5),
      _getArticleModel(10, "物品架", "1个", 5),
      _getArticleModel(11, "奶瓶收纳盒", "1个", 5),
      _getArticleModel(12, "婴儿理发推头器", "1个", 5, desc: "选择静音的"),
      _getArticleModel(13, "小夜灯", "1台", 5, desc: "方便喂奶"),
      _getArticleModel(14, "耳温枪", "1个", 5),
      _getArticleModel(15, "尿布台", "1个", 5),
      _getArticleModel(16, "退烧贴", "若干", 5),
      _getArticleModel(17, "碘伏消毒棉签", "若干", 5),
      _getArticleModel(18, "婴儿防惊跳睡袋", "1个", 5),
    ];
  }

  static Map<String, dynamic> _getArticleModel(
      int articleId, String name, String count, int categoryId,
      {int selected, String desc}) {
    return {
      "articleId": articleId,
      "name": name,
      "count": count,
      "desc": desc,
      "categoryId": categoryId,
      "selected": selected = 0,
    };
  }
}

/// 宝妈数据
class MomData {

  /// 宝妈类别数据
  static List<Map<String, dynamic>> categoryData() {
    // 类别ID 6-宝妈待产包
    return <Map<String, dynamic>>[
      _getCategoryMap(categoryId: 6, categoryName: "宝妈待产包"),
    ];
  }

  static Map<String, dynamic> _getCategoryMap({int categoryId, String categoryName}) {
    return <String, dynamic>{
      "categoryId" : categoryId,
      "categoryName" : categoryName
    };
  }

  /// 宝妈待产包数据
  static List<Map<String, dynamic>> listWaitingBag() {
    return <Map<String, dynamic>>[
      _getArticleModel(1, "护理垫", "若干", 6),
      _getArticleModel(2, "刀纸", "若干", 6),
      _getArticleModel(3, "卫生巾", "若干", 6, desc: "平时使用的即可，不需要产妇卫生巾"),
      _getArticleModel(4, "会阴冲洗器", "1个？", 6, desc: "顺产必备"),
      _getArticleModel(5, "脸盘、毛巾（吸汗）、软毛牙刷、牙膏", "若干", 6, desc: "软毛即可，不一定非要月子牙刷"),
      _getArticleModel(6, "一次性马桶垫", "若干", 6),
      _getArticleModel(7, "吸奶器、储奶袋", "1副", 6, desc: "可根据产后情况买"),
      _getArticleModel(8, "防溢乳垫", "若干", 6, desc: "建议先买一盒备用，根据产后母乳再囤货"),
      _getArticleModel(9, "哺乳文胸", "若干", 6),
      _getArticleModel(10, "月子服", "若干", 6),
      _getArticleModel(11, "月子鞋", "若干", 6),
      _getArticleModel(12, "长款棉袜", "若干", 6),
      _getArticleModel(13, "帽子", "若干", 6),
      _getArticleModel(14, "一次性内裤", "若干", 6),
      _getArticleModel(15, "乳头霜", "若干", 6),
      _getArticleModel(16, "收腹带", "2条", 6),
      _getArticleModel(17, "可弯曲吸管", "若干", 6),
      _getArticleModel(18, "厕纸、纸巾", "若干", 6),
    ];
  }

  static Map<String, dynamic> _getArticleModel(
      int articleId, String name, String count, int categoryId,
      {int selected, String desc}) {
    return {
      "articleId": articleId,
      "name": name,
      "count": count,
      "desc": desc,
      "categoryId": categoryId,
      "selected": selected = 0,
    };
  }
}
