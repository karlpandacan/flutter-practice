import 'package:flutter/material.dart';

import 'package:practice/views/login.dart';
import 'package:practice/views/announcements.dart';
import 'package:practice/views/guidelines.dart';

//Route Names
const String loginPage = 'login';
const String announcementPage = 'announcements';
const String guidelinePage = 'guidelines';

//Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => Login());
    case announcementPage:
      return MaterialPageRoute(builder: (context) => Announcement());
    case guidelinePage:
      return MaterialPageRoute(builder: (context) => Guidelines());
    default:
      throw ('This Page is Not Found.');
  }
}
