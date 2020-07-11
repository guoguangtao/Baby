
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YXCNoDataWidget extends StatelessWidget {

  final String imageName; // 图片名称
  final String desc; // 描述
  final double width; // 图片宽度
  final Color imageColor; // 图片颜色
  final TextStyle textStyle; // 文字style
  final GestureTapCallback onTap;

  YXCNoDataWidget({
    this.imageName = 'assets/images/icon/noData.png',
    this.desc = '暂无数据',
    this.width = 80,
    this.imageColor = const Color(0xFFF695C2),
    this.textStyle = const TextStyle(fontSize: 15.0, color: Color(0xFFF695C2)),
    this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageName, color: imageColor, width: width,),
            Text(desc, style: textStyle,),
          ],
        ),
      ),
      onTap: (){
        if (onTap != null) {
          onTap();
        }
      },
    );
  }
}
