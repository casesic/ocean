class Daily {
  final String date;
  final List<Story> topstories;
  final List<Story> stories;

  Daily.fromJson(Map<String, dynamic>json)
      :this.date=json['date'],
        this.topstories=
        (json['top_stories'] == null) ? [] :
        List<Story>.from(json['top_stories'].map((x) => Story.fronJson(x))),
        this.stories=List<Story>.from(
            json['stories'].map((x) => Story.fronJson(x)));

}
  class Story{
    final String title;
    final String url;  //url:统一资源定位符，指出文件的位置以及浏览器该怎么处理它
    final String hint;  //hint:输入框，指定提示语???
    final String image;
    final String imageHue;  //轮播图下方渐变颜色

  Story.fronJson(Map<String,dynamic>json)
    :this .title=json['title'],
     this.url=json['url'],
     this.hint=json['hint'],
     this.imageHue=json['image_hue'],
    this.image=
    //作一个判断，[top_stories]中是image,[stories]是images
    (json['images'==null])? json['image']:
        List<String>.from(json['images']).first;//???
}