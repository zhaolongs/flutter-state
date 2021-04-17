import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CountController.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 就是定义页面主体显示 你甚至都不用使用 StatefulWidget
class CountMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        //使用 GetBuilder 获取数据
        child: GetBuilder<CountController>(
          //绑定Controller
          init: CountController(),
          builder: (CountController controller) {
            return Text("当前显示计数 ${controller.count}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //第三步 使用 find  调用方法通信
          Get.find<CountController>().addCount2();
        },
      ),
    );
  }
}
