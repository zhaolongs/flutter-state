import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shop/src/model/home_card_model.dart';
import 'package:provider_shop/src/model/home_item_model.dart';
import 'package:provider/provider.dart';
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 3/19/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeListItemWidget extends StatefulWidget {
  final int index;
  final ListItemBean list;

  const HomeListItemWidget({Key key, this.index, this.list}) : super(key: key);


  @override
  _HomeListItemWidgetState createState() => _HomeListItemWidgetState();
}

class _HomeListItemWidgetState extends State<HomeListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return buildItem(widget.index, widget.list);
  }

  Widget buildItem(int index, ListItemBean bean) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            bean.image,
            width: 100,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: buildColumn(bean),
          ),
        ],
      ),
    );
  }

  Column buildColumn(ListItemBean bean) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${bean.title}"),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "价格${bean.price}",
              ),
            ),
            GestureDetector(
              onTap: () {
                if (bean.isAdd) {
                  bean.isAdd = false;
                  //移出购物车
                  context.read<HomeCardModel>().removeCardList(bean);
                }else {
                  bean.isAdd = true;
                  //添加购物车
                  context.read<HomeCardModel>().addCardList(bean);
                }
                setState(() {

                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: bean.isAdd?Colors.orange:Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  bean.isAdd ?"移除购物车":"加入购物车",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
