import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/shop/ShopBean.dart';
import 'package:flutter_getx_shop/page/shop/ShopController.dart';
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
class ShopItemWidget extends StatefulWidget {
  final GoodsBean goodsBean;

  ShopItemWidget(this.goodsBean);

  @override
  _ShopItemWidgetState createState() => _ShopItemWidgetState();
}

class _ShopItemWidgetState extends State<ShopItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(14),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //左侧的图片
            Container(
              child: Icon(Icons.one_k),
              width: 100,
              height: 100,
              margin: EdgeInsets.only(right: 16),
              color: Colors.grey[200],
            ),
            //右侧的文本
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.goodsBean.title}"),
                  Text("${widget.goodsBean.subTitle}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.goodsBean.isCard = !widget.goodsBean.isCard;
                          Get.find<ShopController>().addCard(widget.goodsBean);
                          setState(() {

                          });
                        },
                        child: Text(widget.goodsBean.isCard?"移出购物车":"加入购物车"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
