import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_shop/page/shop/ShopBean.dart';
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
class ShopController extends GetxController{

  //定义数组 保存分类数据
  List<ShopClassBean> _classBeanList = [];

  List<ShopClassBean> get  classBeanList => _classBeanList;

  //模拟网络 请求
  void requestShopClass() async{
    //清空分类数据
    _classBeanList = [];
    await Future.delayed(Duration(seconds: 2),);
    for (int i = 0; i < 10; i++) {
      _classBeanList.add(ShopClassBean(i, "分类$i"));
    }
    update();
  }

  Map<int,List<GoodsBean>> map = Map() ;

  List<GoodsBean> _currentGoods = [];

  List<GoodsBean> get currentGoods =>_currentGoods;

  //根据分类来请求商品信息
  void requesShopGoodsList(ShopClassBean element) async{
    //保存商品列表数据
    List<GoodsBean> goodsList = map[element.id];
    if(goodsList==null||goodsList.length==0){
      goodsList =[];
      //模拟商品列表数据
      for (int i = 0; i < 200; i++) {
        GoodsBean bean = GoodsBean();
        bean.id = i+element.id+(Random().nextInt(100));
        bean.title="超级小水果 ${element.title}";
        goodsList.add(bean);
      }
      //保存每一个分类中的列表数据
      map[element.id] =goodsList;
    }

    _currentGoods = goodsList;
    //更新当前分类
    update(["${element.id}"]);

  }


  //定义购物车
  List<int> _cardList =[];
  List<int> get cardList =>_cardList;
  void addCard(GoodsBean bean){
    if(!_cardList.contains(bean.id)){
      _cardList.add(bean.id);
    }else{
      _cardList.remove(bean.id);
    }
    update(["card"]);
  }

}