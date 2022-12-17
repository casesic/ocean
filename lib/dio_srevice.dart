import 'package:dio/dio.dart';
import 'model.dart';
class DioService{
  static Future<Daily> getTodayNews() async{
var response=await Dio().get('https://news-at.zhihu.com/api/3/news/latest');
var daily=Daily.fromJson(response.data);
return daily;
  }

//根据日期，获取新闻
static Future<Daily> getBeforeNews(DateTime date)async {
    date= date.add(Duration(days: 1));//???
    var year=date.year;
    var month=date.month;
    var day=date.day;
    var str='$year${month<10?'0$month':month}${day<10?'0$day':day}';//???
  var response=await Dio().get('https://news-at.zhihu.com/api/3/news/latest');
  var daily=Daily.fromJson(response.data);
  return daily;

}
}

