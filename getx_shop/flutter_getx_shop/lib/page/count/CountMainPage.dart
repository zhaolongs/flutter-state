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
/// 代码清单
///代码清单
class CountMainPage extends StatefulWidget {
  @override
  _CountMainPageState createState() => _CountMainPageState();
}

class _CountMainPageState extends State<CountMainPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            buildColumn(),
            buildColumn2(),
            buildColumn3(),
          ],
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        Text("当前显示计数 $_count"),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            _count++;
            setState(() {});
          },
          child: Text("添加"),
        ),
      ],
    );
  }

  buildColumn2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        //第二步 使用 GetBuilder 获取数据
        GetBuilder<CountController>(
            init: CountController(),
            builder: (CountController controller) {
              return Text("当前显示计数 ${controller.count}");
            }),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            //第三步 使用 find  调用方法通信
            Get.find<CountController>().add();
          },
          child: Text("添加"),
        ),
      ],
    );
  }

  buildColumn3() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        //第二步 使用 GetBuilder 获取数据
        GetBuilder<CountController>(
            init: CountController(),
            id: "count2",
            builder: (CountController controller) {
              return Text("当前显示计数 ${controller.count2}");
            }),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            //第三步 使用 find  调用方法通信
            Get.find<CountController>().addCount2();
          },
          child: Text("添加"),
        ),
      ],
    );
  }
}
