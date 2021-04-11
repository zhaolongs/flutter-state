import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/count/CountMainPage.dart';
import 'package:flutter_getx_shop/page/obs/CountObsMainPage.dart';
import 'package:flutter_getx_shop/page/route/RouteMainPage.dart';
import 'package:flutter_getx_shop/page/route/TestAPage.dart';
import 'package:flutter_getx_shop/page/shop/ShopMainPage.dart';
import 'package:flutter_getx_shop/page/workes/WorkesMainPage.dart';
import 'package:get/get.dart';

//程序入口
void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用 GetX第一步
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //静态路径
      routes: {
        "/testa": (context) => TestAPage(),
      },
      //默认显示的首页页面
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(RouteMainPage());
              },
              child: Text("1  路由案例"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                Get.to(CountMainPage());
              },
              child: Text("2  getx 状态管理计数器"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                Get.to(CountObsMainPage());
              },
              child: Text("3  getx 响应编程"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                Get.to(WorkesMainPage());
              },
              child: Text("4  getx 工作流"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                Get.to(ShopMainPage());
              },
              child: Text("5 商品列表添加购物车"),
            ),
          ],
        ),
      ),
    );
  }

}
