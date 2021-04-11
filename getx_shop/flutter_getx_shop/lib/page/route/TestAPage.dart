import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

class TestAPage extends StatefulWidget {
  @override
  _TestAPageState createState() => _TestAPageState();
}

class _TestAPageState extends State<TestAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试A页面"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              buildExti1(),
              buildExti2(),
            ],
          )),
    );
  }

  buildExti1() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop("A页面回传的数据");
      },
      child: Text("普通方式退出页面"),
    );
  }

  buildExti2() {
    return ElevatedButton(
      onPressed: () {
        //退出页面
        //Get.back();
        //退出页面 返回数据
        Get.back(result: "getx关闭的页面");
      },
      child: Text("getx 方式退出页面"),
    );
  }
}
