import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/src/model/home_card_model.dart';
import 'package:provider_shop/src/model/home_item_model.dart';
import 'package:provider_shop/src/model/home_tab_model.dart';

import 'home_list_item_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/19/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeItemPage extends StatefulWidget {
  final TabBean tabBean;

  const HomeItemPage({Key key, this.tabBean}) : super(key: key);

  @override
  _HomeItemPageState createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("页面创建 ${widget.tabBean.title}");
    Future.delayed(Duration.zero, () {
      //请求数据
      context.read<HomeItemModel>().requestItemList(widget.tabBean.title,widget.tabBean.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("页面销毁 ${widget.tabBean.title}");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<ListItemBean> list = context.watch<HomeItemModel>().itemList(widget.tabBean.id);

    if (list.length == 0) {
      return Center(
        child: Text("加载中"),
      );
    }

    //懒加载
    return ListView.builder(
      //子 Item 个数
      itemCount: list.length,
      //子 Item 布局构建
      itemBuilder: (BuildContext context, int index) {
        return HomeListItemWidget(index:index, list:list[index]);
      },
    );
  }



  @override
  bool get wantKeepAlive => true;
}
