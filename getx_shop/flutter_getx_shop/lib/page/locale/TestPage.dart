import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/14/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
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
      translations: TranslationService(),
      // 你的翻译
      locale: Locale('zh', 'CN'),
      // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('en', 'US'),
      // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      //默认显示的首页页面
      home: TestPage(),
    );
  }
}

///
/// 代码清单
///代码清单
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Text('title'.tr),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                    },
                    child: Text("EN-US"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var locale =Locale('zh', 'CN');
                      Get.updateLocale(locale);
                    },
                    child: Text("zh-CN"),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('zh', 'CN');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}

const Map<String, String> en_US = {
  'title': 'this is title',
};

const Map<String, String> zh_CN = {
  'title': '这是标题',
};
