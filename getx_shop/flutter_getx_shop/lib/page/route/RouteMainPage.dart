import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'TestAPage.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单
class RouteMainPage extends StatefulWidget {
  @override
  _RouteMainPageState createState() => _RouteMainPageState();
}

class _RouteMainPageState extends State<RouteMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                fun1();
              },
              child: Text("动态路由打开A页面"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                fun2(context);
              },
              child: Text("静态路由打开A页面"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 动态的方式
                fun3();
              },
              child: Text("getx 动态路由打开A页面"),
            ),
            ElevatedButton(
              onPressed: () {
                //动态 静态的方式
                fun4();
              },
              child: Text("getx 静态路由打开A页面"),
            ),
            ElevatedButton(
              onPressed: () {
                fun5();
              },
              child: Text("getx 动态路由打开A页面 获取返回值"),
            ),
            ElevatedButton(
              onPressed: () {
                fun6();
              },
              child: Text("普通方式替换当前页面"),
            ),
          ],
        ),
      ),
    );
  }

  //Gex 动态的方式  获取数据
  void fun5() async {
    //动态 态的方式 并获取A页面的返回值
    var value = await Get.to(new TestAPage());
    print("A页面的返回值 $value");
  }

  //GetX 静态的方式
  void fun4() {
    Get.toNamed("/tefun4");
  }

  //GetX 动态 动态的方式
  void fun3() {
    Get.to(new TestAPage());
  }

  //动态 静态的方式
  void fun2(BuildContext context) {
    Navigator.of(context).pushNamed("/testa");
  }

  void fun1() {
    //动态 路由的方式
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TestAPage();
        },
      ),
    ).then((value) {
      //获取上一个页面的数据
    });
  }

  void fun6() {
    //Getx 替换当前的页面
    Get.off(new TestAPage());
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TestAPage();
        },
      ),
    );
  }

  //打开新的页面 并关闭之前所有的页面
  void fun7() {

    Get.offAll(new TestAPage());

    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TestAPage();
        },
      ),
          (Route route) => false,
    );
  }
}