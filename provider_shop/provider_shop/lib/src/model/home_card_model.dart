import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_item_model.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/19/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeCardModel with ChangeNotifier {
  //购物车
  List<ListItemBean> _list = [];

  void addCardList(ListItemBean itemBean) async {
    _list.add(itemBean);
    notifyListeners();
  }

  void removeCardList(ListItemBean itemBean) {
    List<ListItemBean> themList = [];
    _list.forEach((element) {
      if(element.id!=itemBean.id){
        themList.add(element);
      }
    });
    _list = themList;

    notifyListeners();
  }

  //获取数据的方法
  List<ListItemBean> get cardList => _list;
}

