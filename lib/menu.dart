import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpd/utils/style.dart';

class MenuBox extends StatefulWidget {
  final bool isDesktop;
  MenuBox({@required this.isDesktop});
  @override
  State<StatefulWidget> createState() => MenuBoxState();
}

class MenuBoxState extends State<MenuBox> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  bool isDark = false;
  Tween<double> scaleTween;
  double opac = 0.5;
  int fontReducer;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 110));
    scaleTween = Tween<double>(begin: 2, end: 1);
    scaleAnimation = scaleTween.animate(controller);
    //     CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    if (Style.FONT_COLOR == Colors.black) {
      isDark = false;
    } else {
      isDark = true;
    }
  }

  MenuBoxState() {
    Future.delayed(Duration(milliseconds: 10)).then((value) {
      setState(() {
        opac = 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDesktop) {
      ScreenUtil.instance = ScreenUtil(
          width: Style.SCREEN_WIDTH,
          height: Style.SCREEN_HEIGHT,
          allowFontScaling: true)
        ..init(context);
      fontReducer = 0;
    } else {
      ScreenUtil.instance = ScreenUtil(
          width: Style.PHONE_SCREEN_WIDTH,
          height: Style.PHONE_SCREEN_HEIGHT,
          allowFontScaling: true)
        ..init(context);
      fontReducer = 5;
    }
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: ScreenUtil().setWidth(Style.DIALOG_W),
            height: ScreenUtil().setHeight(Style.DIALOG_H),
            decoration: ShapeDecoration(
              color: Style.BACKGROUND_COLOR.withOpacity(opac),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(29),
                vertical: ScreenUtil().setHeight(78)),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                      color: Style.FONT_COLOR,
                      fontSize: ScreenUtil().setSp(18 - fontReducer),
                      fontFamily: Style.OS_SEMIBOLD),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: isDark,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        // isDark = value;
                        if (isDark) {
                          Style.FONT_COLOR = Colors.black;
                          Style.BACKGROUND_COLOR = Colors.white;
                          isDark = false;
                        } else {
                          Style.FONT_COLOR = Colors.white;
                          Style.BACKGROUND_COLOR = Style.DARK_COLOR;
                          isDark = true;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
