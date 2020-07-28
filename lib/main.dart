// TODO 2: Put URL Links

import 'package:flutter/material.dart';
import 'package:fpd/utils/style.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'rootpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Style.DARK_COLOR),
        title: 'manish kumar',
        home: ResponsiveClass());
  }
}

class ResponsiveClass extends StatefulWidget {
  @override
  _ResponsiveClassState createState() => _ResponsiveClassState();
}

class _ResponsiveClassState extends State<ResponsiveClass> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RootPage(isDesktop: false),
      desktop: RootPage(isDesktop: true),
    );
  }
}
