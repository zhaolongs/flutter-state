import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/src/model/home_card_model.dart';
import 'package:provider_shop/src/model/home_tab_model.dart';
import 'package:provider_shop/src/page/test/test_count04_page.dart';

import 'home_item_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/19/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //请求数据
      context.read<HomeTabModel>().request();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页面"),
        bottom: buildTabs(),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context) {
                    return TestThemPage();
                  }));
            },
            child: Text("测试页面"),
          ),
        ],
      ),
      backgroundColor: Color(0xfff4f4f4),
      body: buildTabBarView(),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Container(
              color: Colors.orange,
              height: 44,
              width: 44,
            ),
          ),
          Positioned(child: buildCardText())
        ],
      ),
    );
  }

  buildTabs() {
    //获取分类数据
    List<TabBean> list = context.watch<HomeTabModel>().tabList;

    if (list.length == 0) {
      return PreferredSize(
        child: Container(
          child: Text(
            "加载中",
            style: TextStyle(color: Colors.white),
          ),
          margin: EdgeInsets.only(bottom: 12),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 40),
      );
    }

    //构建Tab
    List<Tab> tabList = [];
    list.forEach((element) {
      tabList.add(Tab(
        text: element.title,
      ));
    });
    _tabController = new TabController(length: tabList.length, vsync: this);
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      tabs: tabList,
    );
  }

  buildTabBarView() {
    if (_tabController == null) {
      return Center(
        child: Text("加载中"),
      );
    }

    //获取分类数据
    List<TabBean> list = context.watch<HomeTabModel>().tabList;

    List<HomeItemPage> itemList = [];
    list.forEach((element) {
      itemList.add(HomeItemPage(
        tabBean: element,
      ));
    });

    return TabBarView(
      controller: _tabController,
      children: itemList,
    );
  }

  buildCardText() {
    //使用消费者  Consumer 来接收数据
    return Consumer<HomeCardModel>(builder:
        (BuildContext context, HomeCardModel cardModel, Widget widget) {
      return Text("${cardModel.cardList.length}");
    });
  }




}
