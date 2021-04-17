
import 'package:get/get.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 4/10/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 

///第一步定义  Controller
class CountController extends GetxController{

  int _count=0;
  int _count2 = 0;

  int get count=>_count;
  int get count2=>_count2;

  //根据ID更新
  void addCount2(){
    _count2++;
    //更新指定位置 count2 是自定的ID 可以随意定义
    update(["count2"]);
  }

  void add(){
    _count++;
    update();
  }

}