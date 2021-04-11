import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/19/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeTabModel with ChangeNotifier {
  List<TabBean> _list = [];

  void request() async {
    await Future.delayed(Duration(milliseconds: 4000), () {
      for (int i = 0; i < 10; i++) {
        TabBean tabBean = TabBean(i, "测试$i");
        _list.add(tabBean);
      }
    });
    notifyListeners();
  }

  //获取数据的方法
  List<TabBean> get tabList => _list;
}

class TabBean {
  int id;
  String title;

  TabBean(this.id, this.title);
}

