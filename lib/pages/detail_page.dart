import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterplayerlistapp/core/const.dart';
import 'package:flutterplayerlistapp/widget/custom_button.dart';
import 'package:flutterplayerlistapp/widget/progress_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  var _value;
  AnimationController _controller;
  var isplay;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _value = 0.9;
    isplay = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomWidget(
                  size: 50,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.styleColor,
                  ),
                ),
                Text("PLAYING NOW", style: TextStyle(color: AppColors.styleColor, fontWeight: FontWeight.bold),),
                CustomWidget(
                  size: 50,
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    color: AppColors.styleColor,
                  ),
                ),
              ],
            ),
          ),
          CustomWidget(
            image: "assets/images/logo.png",
            size: MediaQuery.of(context).size.width * .8,
            borderWidth: 5,
            onTap: () {}, // { Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(),),);},
          ),
          Expanded(child: SizedBox(),),
          Text(
            "X Calibre",
            style: TextStyle(
              color: AppColors.styleColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
           Text(
            "consonance",
            style: TextStyle(
              color: AppColors.styleColor.withAlpha(90),
              fontSize: 17,
            ),
          ),
          Expanded(child: SizedBox(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ProgressWidget(
              value: _value,
              labelStart: "1.05",
              labelEnd: "3.50",
            ),
          ),
          Expanded(child: SizedBox(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomWidget(
                  size: 80,
                  onTap: () {
                    setState(() {
                      if (_value > .1){
                        _value -= .1;
                      }
                    });
                  },
                  child: Icon(
                    Icons.skip_previous,
                    color: AppColors.styleColor,
                  ),
                ),
                CustomWidget(
                  size: 90,
                  onTap: () {
                    if (_controller.value == 0){
                      _controller.forward();
                      setState(() {
                        isplay = false;
                      });
                    }
                    else{
                      _controller.reverse();
                      setState(() {
                        isplay = true;
                      });
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.pause_play,
                    progress: _controller,
                    color: isplay ? Colors.white : AppColors.styleColor,

                  ),
                  isActive: isplay,
                ),

                CustomWidget(
                  size: 80,
                  onTap: () {
                    setState(() {
                      if (_value < .9){
                        _value += .1;
                      }
                    });
                  },
                  child: Icon(
                    Icons.skip_next,
                    color: AppColors.styleColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35,),
        ],
      ),
    );
  }
}
