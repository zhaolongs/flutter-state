import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/src/model/count_model.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/18/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// Provider 的基本使用
class TestCountPage extends StatefulWidget {
  @override
  _TestCountPageState createState() => _TestCountPageState();
}

class _TestCountPageState extends State<TestCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试计数器"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //第二步显示使用
              //取用数据的第一种方式
              Text("显示计数 ${context.watch<CountModel>().count}"),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //第三步修改数据  修改数据的第一种方式
          context.read<CountModel>().add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
