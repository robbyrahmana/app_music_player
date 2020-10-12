import 'package:flutter/cupertino.dart';
import 'package:flutterplayerlistapp/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutterplayerlistapp/model/music_model.dart';
import 'package:flutterplayerlistapp/pages/detail_page.dart';
import 'package:flutterplayerlistapp/widget/custom_button.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;
  int _playId;

  @override
  void initState(){
    _playId = 3;
    _list = MusicModel.list;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          "CONSONANCE",
          style: TextStyle(color: AppColors.styleColor),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomWidget(
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: () {},
                    ),
                    CustomWidget(
                      image: "assets/images/logo.png",
                      size: 175,
                      borderWidth: 5,
                      onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(),),);},
                    ),
                    CustomWidget(
                      child: Icon(
                        Icons.menu,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _list.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(),),);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          color: _list[index].id == _playId ? AppColors.activeColor : AppColors.mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(30),),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(_list[index].title, style: TextStyle(
                                  color: AppColors.styleColor,
                                  fontSize: 18,
                                ),),
                                Text(_list[index].album, style: TextStyle(
                                  color: AppColors.styleColor.withAlpha(100),
                                  fontSize: 18,
                                ),),
                              ],
                            ),
                            CustomWidget(
                              child: Icon(_list[index].id == _playId ? Icons.pause : Icons.play_arrow, color: _list[index].id == _playId ? Colors.white : AppColors.styleColor,),
                              size: 50,
                              onTap: () {
                                setState(() {
                                  _playId = _list[index].id;
                                });
                              },
                              isActive: _list[index].id == _playId,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor.withAlpha(0),
                    AppColors.mainColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}