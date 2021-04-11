import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/src/model/count02_model.dart';
import 'package:provider_shop/src/model/count_model.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/18/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// Provider 的基本使用
class TestThemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestThemState();
  }
}

class _TestThemState extends State {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CountModel(),
      child: TestCount04Page(),
    );
  }
}

class TestCount04Page extends StatefulWidget {
  @override
  _TestCount04PageState createState() => _TestCount04PageState();
}

class _TestCount04PageState extends State<TestCount04Page> {
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
              Text("CountModel 显示计数 ${context.watch<CountModel>().count}"),
              Text("CountModel 显示计数 ${context.watch<CountModel>().count}"),
              Text("CountModel 显示计数 ${context.watch<CountModel>().count}"),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return TestA();
                  }));
                },
                child: Text("跳转A页面 "),
              ),
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

class TestA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      appBar: AppBar(
        title: Text("测试B页面"),
      ),
      body: Column(
        children: [
          Text("共享数据  ${context.watch<CountModel02>().count}"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return TestB();
                }));
              },
              child: Text("B页面 ")),
        ],
      ),
    );
  }
}

class TestB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试B页面"),
      ),
      body: Column(
        children: [
          Text("共享数据  ${context.watch<CountModel02>().count}"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return TestC();
                }));
              },
              child: Text("添加数据 ")),
        ],
      ),
    );
  }
}

class TestC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试C页面"),
      ),
      body: Column(
        children: [
          Text("共享数据  ${context.watch<CountModel02>().count}"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return TestD();
                }));
              },
              child: Text("添加数据 ")),
        ],
      ),
    );
  }
}

class TestD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试D页面"),
      ),
      body: Column(
        children: [
          Text("共享数据  ${context.watch<CountModel02>().count}"),
          ElevatedButton(
              onPressed: () {
                context.read<CountModel02>().add();
              },
              child: Text("添加数据 ")),
        ],
      ),
    );
  }
}
