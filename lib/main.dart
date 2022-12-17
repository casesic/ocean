import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "知乎日报",
      debugShowCheckedModeBanner: false,
      //使用theme统一颜色和字体风格
      theme:ThemeData(
primaryColor: Colors.white,
      ),
        home: Homepage(),
    );
  }
}



