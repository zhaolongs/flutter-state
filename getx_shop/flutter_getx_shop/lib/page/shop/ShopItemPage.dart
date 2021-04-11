import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/shop/ShopBean.dart';
import 'package:flutter_getx_shop/page/shop/ShopController.dart';
import 'package:get/get.dart';

import 'ShopItemWidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 商品列表子页面
class ShopItemPage extends StatefulWidget {
  //分类数据
  final ShopClassBean element;

  ShopItemPage(this.element);

  @override
  _ShopItemPageState createState() => _ShopItemPageState();
}

class _ShopItemPageState extends State<ShopItemPage> {
  ShopController _shopController = Get.put(ShopController());

  @override
  void initState() {
    super.initState();

    //请求商品列表数据
    _shopController.requesShopGoodsList(widget.element);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "${widget.element.id}",
      builder: (ShopController controller) {
        List<GoodsBean> list = controller.currentGoods;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            //获取商品
            GoodsBean goodsBean = list[index];
            return ShopItemWidget(goodsBean);
          },
        );
      },
    );
  }
}
