import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
class WorkesController extends GetxController{

  RxString _keywords=''.obs;

  RxString get keywords =>_keywords;

  void onChange(value){
    _keywords.value = value;
  }

  //搜索功能
  void search(){
    print("搜索");
  }

}