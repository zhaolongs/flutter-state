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
/// Provider 基本使用02 接收数据的 三种方式
class TestCount02Page extends StatefulWidget {
  @override
  _TestCount02PageState createState() => _TestCount02PageState();
}

class _TestCount02PageState extends State<TestCount02Page> {
  @override
  Widget build(BuildContext context) {
    CountModel model = Provider.of<CountModel>(context);

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
              //取用数据的第二种方式
              Text("显示计数 ${Provider.of<CountModel>(context).count}"),
              //显示数据第三种
              buildCustum()
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //第三步修改数据  修改数据的第一种方式
          // context.read<CountModel>().add();
          //修改数据的第二种方式
          model.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ///显示数据第三种方式
  buildCustum() {
    return Consumer<CountModel>(
      builder: (BuildContext context, CountModel model, Widget child) {
        return Text("Consumer 显示 ${model.count}");
      },
    );
  }
}
