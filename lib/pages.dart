import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fpd/utils/string_values.dart';
import 'package:fpd/utils/style.dart';

class Pages {
  static List widgetListGetter(BuildContext context, bool isDesktop) {
    return [
      [
        homePageOne(context, isDesktop),
        homePageTwo(context, isDesktop),
        homePageThree()
      ],
      [nofacePageOne(), nofacePageTwo(), nofacePageFour()],
      [dlPageOne(), dlPageTwo(), dlPageThree()],
      [
        venloPageOne(),
        venloPageTwo(),
        venloPageThree(),
        venloPageFour(),
        venloPageFive(context, isDesktop)
      ],
      [contactPageOne(), contactPageTwo(context, isDesktop)],
    ];
  }

  static Widget homePageOne(context, isDesktop) {
    int fontReducer;
    if (isDesktop) {
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
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromRGBO(157, 220, 224, 1),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Image(
                image: NetworkImage(
                    'https://media.giphy.com/media/xUOxfjsW9fWPqEWouI/giphy.gif'),
                fit: BoxFit.contain,
              )),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringValues.ABOUT,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Style.KRONA,
                        fontSize: ScreenUtil().setSp(35 - fontReducer)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    StringValues.ABOUTME,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Style.OS_SEMIBOLD,
                        fontSize: ScreenUtil().setSp(18 - fontReducer)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  static Widget homePageTwo(context, isDesktop) {
    int fontReducer;
    if (isDesktop) {
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
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(color: Color.fromRGBO(253, 203, 117, 1)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringValues.LANGUAGE,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Style.KRONA,
                        fontSize: ScreenUtil().setSp(30 - (fontReducer * 2))),
                  ),
                  for (int i = 0; i < StringValues.LANGUAGES_LIST.length; i++)
                    Text(
                      StringValues.LANGUAGES_LIST[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Style.OS_SEMIBOLD,
                          fontSize: ScreenUtil().setSp(18 - fontReducer)),
                    ),
                  SizedBox(height: ScreenUtil().setHeight(30 - fontReducer)),
                  Text(
                    StringValues.TOOLS,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Style.KRONA,
                        fontSize: ScreenUtil().setSp(30 - (fontReducer * 2))),
                  ),
                  for (int i = 0; i < StringValues.TOOLS_LIST.length; i++)
                    Text(
                      StringValues.TOOLS_LIST[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Style.OS_SEMIBOLD,
                          fontSize: ScreenUtil().setSp(18 - fontReducer)),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Image(
              image: NetworkImage(
                'https://media.giphy.com/media/3o7aCTkvSwYU8lHu6s/giphy.gif',
              ),
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  static Widget homePageThree() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromRGBO(138, 153, 172, 1),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
              flex: 4,
              child: Image(
                image: NetworkImage(
                    'https://media.giphy.com/media/lnyEFmow8MXJfbuGV8/giphy.gif'),
                fit: BoxFit.contain,
              )),
          Expanded(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  static Widget nofacePageOne() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Row(
        children: [
          // Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 5,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/skateB.jpg?alt=media&token=b64b7548-b105-46b7-9ea7-f0eb80558fd1'),
                  fit: BoxFit.contain)),
          // Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget nofacePageTwo() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Row(
        children: [
          // Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 5,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/makk2.jpg?alt=media&token=bd1dc29d-fa65-413c-bafd-4101419b231a'),
                  fit: BoxFit.contain)),
          // Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget nofacePageFour() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(213, 242, 253, 1),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 4,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/lk.png?alt=media&token=10bdb7a8-24b2-4a56-a373-7c5899f4ccc6'),
                  fit: BoxFit.contain)),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget dlPageOne() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(106, 100, 198, 1),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 2,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/bag-compressed.jpg?alt=media&token=a24cf7f6-8345-47fe-9c00-7b7271d2ff8f'),
                  fit: BoxFit.contain)),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget dlPageTwo() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(228, 86, 82, 1),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 2,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/corona-compressed.jpg?alt=media&token=4e8ae6ee-db86-43e3-87b0-1222baab61db'),
                  fit: BoxFit.contain)),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget dlPageThree() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(93, 255, 133, 1),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 2,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/auto-compressed.jpg?alt=media&token=449b056c-4677-43c7-8eb8-27d9b898d98f'),
                  fit: BoxFit.contain)),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget venloPageOne() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(44, 51, 59, 1),
      child: Row(
        children: [
          Expanded(flex: 4, child: SizedBox()),
          Expanded(
              flex: 3,
              child: Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/venlo%2Flogo.png?alt=media&token=9b4d280c-1cb2-4291-9abf-800fb494a3de'),
                  fit: BoxFit.contain)),
          Expanded(flex: 4, child: SizedBox()),
        ],
      ),
    );
  }

  static Widget venloPageTwo() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(107, 194, 126, 1),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/venlo%2FMockup%203%20compressed.jpg?alt=media&token=429e17d7-63fe-4c13-aede-0b083f03d40f'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  static Widget venloPageThree() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(107, 194, 126, 1),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/venlo%2FMockup%202%20compressed.jpg?alt=media&token=6237a6a9-eb6c-43bd-8877-2e0e16e8347b'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  static Widget venloPageFour() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(240, 199, 133, 1),
      child: Image(
        image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/mxnish-kumar.appspot.com/o/venlo%2FMockup%20Front%20compressed.jpg?alt=media&token=0863b5ba-db6b-4d80-9dd1-ea8d8015830d'),
        fit: BoxFit.contain,
      ),
    );
  }

  static Widget venloPageFive(BuildContext context, bool isDesktop) {
    int fontReducer;
    if (isDesktop) {
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
      fontReducer = 8;
    }
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              flex: 9,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Color.fromRGBO(44, 51, 59, 1)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:
                              Container(color: Color.fromRGBO(44, 51, 59, 0.5)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Color.fromRGBO(243, 195, 123, 1),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Color.fromRGBO(243, 195, 123, 0.5),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(40 - (fontReducer*3))),
                Text(
                  StringValues.TYPOGRAPHY,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Style.KRONA,
                      fontSize: ScreenUtil().setSp(20-fontReducer)),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  StringValues.AaBb,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Style.MS_BOLD,
                      fontSize: ScreenUtil().setSp(80-(fontReducer*6))),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Text(
                  'MontSerrat - Bold',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Style.KRONA,
                      fontSize: ScreenUtil().setSp(25-fontReducer)),
                ),
                SizedBox(height: ScreenUtil().setHeight(50-fontReducer*4)),
                Text(
                  'Poppins - ${StringValues.SECOND_FONT}',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Style.OS_SEMIBOLD,
                      fontSize: ScreenUtil().setSp(18-fontReducer)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget contactPageOne() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://media.giphy.com/media/hrF6JGf0Rxtjvak92R/giphy.gif'),
            fit: BoxFit.cover),
      ),
    );
  }

  static Widget contactPageTwo(context, bool isDesktop) {
    int fontReducer;
    if (isDesktop) {
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
      fontReducer = 8;
    }
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 98, 146, 1),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Image(
                image: NetworkImage(
                    'https://media.giphy.com/media/c9GU2BJqhhTJS/giphy.gif'),
                fit: BoxFit.contain,
              )),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringValues.CONTACT,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: Style.KRONA,
                      fontSize: ScreenUtil().setSp(35 - fontReducer*2)),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  StringValues.CONTACTME,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: Style.OS_SEMIBOLD,
                      fontSize: ScreenUtil().setSp(18-fontReducer)),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                RaisedButton(
                  color: Color.fromRGBO(102, 56, 154, 1),
                  onPressed: () {},
                  child: Text(
                    StringValues.EMAIL,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Style.OS_SEMIBOLD,
                        fontSize: ScreenUtil().setSp(18-fontReducer)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
