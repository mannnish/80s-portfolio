import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;
import 'pages.dart';
import 'menu.dart';
import 'utils/string_values.dart';
import 'utils/style.dart';

class RootPage extends StatefulWidget {
  final bool isDesktop;
  RootPage({@required this.isDesktop});
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  PageController _pc = PageController(initialPage: 0);
  int currentPageIndex = 0;
  AnimationController menuAnim;
  AnimationController homeAnim;
  int fontReducer = 0;

  @override
  void initState() {
    super.initState();
    menuAnim =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    homeAnim =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    homeAnim.dispose();
    menuAnim.dispose();
    super.dispose();
  }

  Widget leftPanel() {
    return Container(
      height: ScreenUtil().setHeight(Style.LEFT_N_RIGHT_FRAME1_H),
      width: ScreenUtil().setWidth(Style.LEFT_FRAME1_W),
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(Style.LEFT_N_RIGHT_FRAME2_H),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringValues.NAME,
                  style: TextStyle(
                    fontFamily: Style.MS_BOLD,
                    color: Style.FONT_COLOR,
                    fontSize: ScreenUtil().setSp(28 - fontReducer),
                  ),
                ),
                Expanded(flex: 4, child: SizedBox()),
                for (int i = 0; i < StringValues.options.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          StringValues.selectedOption = i;
                          currentPageIndex = 0;
                          _pc.jumpToPage(0);
                          if (!widget.isDesktop) {
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Text(
                        StringValues.options[i],
                        style: TextStyle(
                          fontFamily: Style.OS_SEMIBOLD,
                          color: Style.FONT_COLOR.withOpacity(
                              StringValues.selectedOption == i ? 0.5 : 1),
                          fontSize: ScreenUtil().setSp(18 - fontReducer),
                        ),
                      ),
                    ),
                  ),
                Expanded(flex: 7, child: SizedBox()),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        String url = StringValues.IG;
                        if (kIsWeb) {
                          html.window.open(url, 'tab');
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        size: ScreenUtil().setSp(20 - fontReducer),
                        color: Style.FONT_COLOR == Colors.black
                            ? Colors.purpleAccent
                            : Style.FONT_COLOR,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    InkWell(
                      onTap: () async {
                        String url = StringValues.BEHANCE;
                        if (kIsWeb) {
                          html.window.open(url, 'tab');
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.behance,
                        size: ScreenUtil().setSp(20 - fontReducer),
                        color: Style.FONT_COLOR == Colors.black
                            ? Colors.blueAccent
                            : Style.FONT_COLOR,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    InkWell(
                      onTap: () async {
                        String url = StringValues.LINKEDIN;
                        if (kIsWeb) {
                          html.window.open(url, 'tab');
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        size: ScreenUtil().setSp(20 - fontReducer),
                        color: Style.FONT_COLOR == Colors.black
                            ? Colors.indigo
                            : Style.FONT_COLOR,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    InkWell(
                      onTap: () async {
                        String url = StringValues.GITHUB;
                        if (kIsWeb) {
                          html.window.open(url, 'tab');
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.github,
                        size: ScreenUtil().setSp(20 - fontReducer),
                        color: Style.FONT_COLOR,
                      ),
                    ),
                  ],
                ),
                Text(
                  StringValues.COPYRIGHT,
                  style: TextStyle(
                    fontFamily: Style.OS_SEMIBOLD,
                    color: Style.FONT_COLOR,
                    fontSize: ScreenUtil().setSp(18 - fontReducer),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget rightPanel() {
    return Container(
      height: ScreenUtil().setHeight(widget.isDesktop
          ? Style.LEFT_N_RIGHT_FRAME1_H
          : Style.PHONE_RIGHT_FRAME_H),
      width: ScreenUtil().setWidth(
          widget.isDesktop ? Style.RIGHT_FRAME1_W : Style.PHONE_RIGHT_FRAME_W),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Style.BACKGROUND_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: currentPageIndex > 0
                              ? () {
                                  setState(() {
                                    currentPageIndex--;
                                    _pc.animateToPage(currentPageIndex,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn);
                                  });
                                }
                              : null,
                          child: Text(
                            'Previous',
                            style: TextStyle(
                                color: Style.FONT_COLOR,
                                fontSize: ScreenUtil().setSp(18 - fontReducer),
                                fontFamily: Style.OS_SEMIBOLD),
                          ),
                        ),
                        Text(
                          ' / ',
                          style: TextStyle(
                              color: Style.FONT_COLOR,
                              fontSize: ScreenUtil().setSp(18 - fontReducer),
                              fontFamily: Style.OS_SEMIBOLD),
                        ),
                        GestureDetector(
                          onTap: currentPageIndex <
                                  Pages.widgetListGetter(
                                                  context, widget.isDesktop)[
                                              StringValues.selectedOption]
                                          .length -
                                      1
                              ? () {
                                  setState(() {
                                    currentPageIndex++;
                                    _pc.animateToPage(currentPageIndex,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn);
                                  });
                                }
                              : () {},
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Style.FONT_COLOR,
                                fontSize: ScreenUtil().setSp(18 - fontReducer),
                                fontFamily: Style.OS_SEMIBOLD),
                          ),
                        ),
                        Text(widget.isDesktop ? '    ' : '  '),
                        Text(
                          '( ${currentPageIndex + 1} of ${Pages.widgetListGetter(context, widget.isDesktop)[StringValues.selectedOption].length} )',
                          style: TextStyle(
                              color: Style.FONT_COLOR,
                              fontSize: ScreenUtil().setSp(18 - fontReducer),
                              fontFamily: Style.OS_SEMIBOLD),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      menuAnim.forward();
                      await showDialog(
                          context: context,
                          builder: (_) => MenuBox(isDesktop: widget.isDesktop));
                      menuAnim.reverse();
                      setState(() {
                        print("nothing");
                      });
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      color: Style.FONT_COLOR,
                      size: ScreenUtil().setSp(25 - fontReducer),
                      progress: menuAnim,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(widget.isDesktop
                ? Style.LEFT_N_RIGHT_FRAME2_H
                : Style.PHONE_RIGHT_FRAME2_H),
            child: PageView(
              controller: _pc,
              physics: NeverScrollableScrollPhysics(),
              children: Pages.widgetListGetter(
                  context, widget.isDesktop)[StringValues.selectedOption],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: Text(
                StringValues.options[StringValues.selectedOption],
                style: TextStyle(
                    color: Style.FONT_COLOR,
                    fontSize: ScreenUtil().setSp(19 - fontReducer),
                    fontFamily: Style.OS_BOLD),
              ),
            ),
          )
        ],
      ),
      // )

      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDesktop) {
      print("desktop");
      ScreenUtil.instance = ScreenUtil(
          width: Style.SCREEN_WIDTH,
          height: Style.SCREEN_HEIGHT,
          allowFontScaling: true)
        ..init(context);
      fontReducer = 0;
    } else {
      print("mobile");
      ScreenUtil.instance = ScreenUtil(
          width: Style.PHONE_SCREEN_WIDTH,
          height: Style.PHONE_SCREEN_HEIGHT,
          allowFontScaling: true)
        ..init(context);
      fontReducer = 5;
    }
    return Scaffold(
      backgroundColor: Style.BACKGROUND_COLOR,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Style.BACKGROUND_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // horizontally
              crossAxisAlignment: CrossAxisAlignment.center, // vertically
              children: [
                widget.isDesktop ? leftPanel() : SizedBox(),
                widget.isDesktop
                    ? SizedBox(width: ScreenUtil().setWidth(Style.FRAME1_GAP))
                    : SizedBox(),
                rightPanel(),
              ],
            ),
          ),
          !widget.isDesktop
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(74)),
                    child: GestureDetector(
                      onTap: () async {
                        homeAnim.forward();
                        await Future.delayed(Duration(milliseconds: 630));
                        await showDialog(
                            context: context,
                            builder: (_) => Scaffold(
                                body: Container(
                                    color: Style.BACKGROUND_COLOR,
                                    constraints: BoxConstraints.expand(),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom:
                                                    ScreenUtil().setHeight(74)),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.menu,
                                                color: Style.FONT_COLOR,
                                                size: ScreenUtil().setSp(22),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(child: leftPanel()),
                                      ],
                                    ))));
                        await Future.delayed(Duration(milliseconds: 100));
                        homeAnim.reverse();
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.home_menu,
                        color: Style.FONT_COLOR,
                        size: ScreenUtil().setSp(22),
                        progress: homeAnim,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
