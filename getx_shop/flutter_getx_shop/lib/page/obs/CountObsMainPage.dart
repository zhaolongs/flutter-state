import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'CountObsController.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// Gex 响应编程
class CountObsMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gex 响应编程"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [

              //显示数据方式一
              GetBuilder<CountObsController>(
                //初始化控制器
                init: CountObsController(),
                //监听回调
                builder: (CountObsController controller) {
                  return Text("当前 count 的值为 ${controller.getCount}");
                },
              ),

              //显示数据方式二
              GetX<CountObsController>(
                //初始化控制器
                init: CountObsController(),
                //监听回调
                builder: (CountObsController controller) {
                  return Text("当前 count 的值为 ${controller.getCount}");
                },
              ),

              //显示数据方式三
              //观察者自动更新
              Obx(() {
                return Text(
                    "Obx 当前 count 的值为 ${Get.find<CountObsController>().getCount}");
              }),

            ],
          )),
      //点击按钮修改值
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.find<CountObsController>().addCount();
        },
      ),
    );
  }
}
