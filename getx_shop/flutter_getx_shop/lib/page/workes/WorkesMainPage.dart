import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/workes/WorkesController.dart';
import 'package:get/get.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class WorkesMainPage extends StatefulWidget {
  @override
  _WorkesMainPageState createState() => _WorkesMainPageState();
}

class _WorkesMainPageState extends State<WorkesMainPage> {
  WorkesController _controller = Get.put(WorkesController());

  @override
  void initState() {
    super.initState();

    //每次修改时的回调
    ever(_controller.keywords, (String value){
      print("ever 执行 $value");
    });

    once(_controller.keywords, (String vlaue){
      print("once 执行 $vlaue");
    });

    //参数一 绑定数据
    //参数二 延时执行方法 、
    //参娄三 时间
    debounce(_controller.keywords, (String value) {
      print("debounce 执行 $value");
      _controller.search();
    }, time: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("getx 工作流"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              TextField(
                //输入文本时 时实回调
                onChanged: (String value) {
                  Get.find<WorkesController>().onChange(value);
                },
              )
            ],
          )),
    );
  }
}
