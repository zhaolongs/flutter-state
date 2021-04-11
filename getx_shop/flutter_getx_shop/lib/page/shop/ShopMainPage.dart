import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/shop/ShopBean.dart';
import 'package:flutter_getx_shop/page/shop/ShopController.dart';
import 'package:get/get.dart';

import 'ShopItemPage.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

class ShopMainPage extends StatefulWidget {
  @override
  _ShopMainPageState createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  ShopController _shopController = Get.put(ShopController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //第一步 网络请求 获取分类数据
    _shopController.requestShopClass();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ShopController controller) {
      //获取数据
      List<ShopClassBean> classList = controller.classBeanList;
      if (classList.length == 0) {
        return Scaffold(
          appBar: AppBar(
            title: Text("商品页面"),
          ),
          body: Center(
            child: Text("加载中"),
          ),
        );
      }

      _tabController = new TabController(length: classList.length, vsync: this);

      //Tab
      List<Tab> tabList = [];
      //子页面
      List<Widget> itemList = [];
      //构建页面数据
      classList.forEach((element) {
        //顶部标签
        tabList.add(Tab(
          text: element.title,
        ));
        //标签子页面
        itemList.add(ShopItemPage(element));
      });

      return Scaffold(
        appBar: AppBar(
          title: Text("商品页面"),
          bottom: buildTabBar(tabList),
        ),
        backgroundColor: Colors.white,
        body: buildTabBarView(itemList),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetBuilder(
            id: "card",
            builder: (ShopController controller) {
              return Text("${controller.cardList.length}");
            },
          ),
        ),
      );
    });
  }

  TabBarView buildTabBarView(List<Widget> itemList) {
    return TabBarView(
      controller: _tabController,
      children: itemList,
    );
  }

  TabBar buildTabBar(List<Tab> tabList) {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      tabs: tabList,
    );
  }
}
