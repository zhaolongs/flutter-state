// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/src/model/count02_model.dart';
import 'package:provider_shop/src/model/count_model.dart';
import 'package:provider_shop/src/model/home_card_model.dart';
import 'package:provider_shop/src/model/home_item_model.dart';
import 'package:provider_shop/src/model/home_tab_model.dart';
import 'package:provider_shop/src/page/provider/HomePage.dart';
import 'package:provider_shop/src/page/test/test_count03_page.dart';
import 'package:provider_shop/src/page/test/test_count04_page.dart';
import 'package:provider_shop/src/page/test/test_count_page.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //第一步 注册
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return CountModel();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return CountModel02();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return HomeTabModel();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return HomeItemModel();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return HomeCardModel();
        }),
      ],
      child: MaterialApp(
        title: "测试",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
