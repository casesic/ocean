import 'package:flutter/material.dart';
import 'dio_srevice.dart';
import 'model.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ctl=ScrollController();
  //加载日期
  List<Daily> days=[];//所有已加载的日期
  DateTime nextdate=DateTime.now().subtract(Duration(days: 1));
  bool loading=false;//是否正在加载

@override//实例成员标记为覆盖具有相同名称的超类成员?
void initState() {
    // TODO: implement initState
    super.initState();
    //申请网络请求，用到异步，addlistener,添加监听器
    ctl.addListener(()async {
      //maxScrollExtent:pixels的最大值
      if(ctl.position.pixels>ctl.position.maxScrollExtent-40){
      if(loading) return;
      loading=true;

      var daily=await DioService.getBeforeNews(nextdate);
      setState(() {
        days.add(daily);
      });
      nextdate=nextdate.subtract(Duration(days: 1));
      loading=false;
      }
    });

    //页面构建完毕后加载数据
  WidgetsBinding.instance?.addPostFrameCallback((_) {
  onRefresh();
  });
  }
  Future<void>onRefresh()async{
  //获取今天的新闻，并刷新页面
  var daily=await DioService.getTodayNews();
  setState(() {
    days=[daily];
    nextdate=DateTime.now().subtract(Duration(days: 1));
  });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
