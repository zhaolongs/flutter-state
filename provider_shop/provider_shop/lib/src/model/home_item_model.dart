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
class HomeItemModel with ChangeNotifier {
  Map<int,List<ListItemBean>> _map =Map();

  void requestItemList(String title ,int page) async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      List<ListItemBean> list = [];
      for (int i = 0; i < 20; i++) {
        ListItemBean tabBean = ListItemBean();
        tabBean.id=i*page;
        tabBean.price=2*i;
        tabBean.title="新鲜的小面条哈喇  $i";
        list.add(tabBean);
      }
      _map[page] = list;
    });
    notifyListeners();
  }

  //获取数据的方法
  List<ListItemBean>  itemList(int page){
    return _map[page]??[];
  }
}



class ListItemBean{
  int id;
  String title;
  int price;
  String image = 'assest/images/banner1.webp';

  bool isAdd = false;
}
