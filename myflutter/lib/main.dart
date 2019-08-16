import 'package:flutter/material.dart';
import 'EG/first.dart';
import 'Two/Two.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _curSelectIndex=0;
  var imgPath=[];
  var pageList=[];
  getImgPath(curIndex){
    if(curIndex==_curSelectIndex){
      return imgPath[curIndex][1];
    }
    return imgPath[curIndex][0];
  }
  initData(){
     imgPath=[
      ["images/btnSet2.png","images/btnSet1.png"],
      ["images/new_choujiang_noChoose.png","images/new_choujiang_choose.png"]
    ];
     pageList=[
       new First(),
       new Two()
     ];
  }


  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body:  pageList[_curSelectIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: Image(image: AssetImage(getImgPath(0)),width: 50,height: 50,),
              title: Text("例子")
            ),
            new BottomNavigationBarItem(
                icon:Image(image: AssetImage(getImgPath(1)), width: 50,height: 50),
                title: Text("ddd")
            )
          ],
          currentIndex: _curSelectIndex,
          selectedItemColor: Colors.red,
          onTap: (index)=>{
            setState(()=>{
              _curSelectIndex=index
            })
          },
      ),

    );
  }
}
