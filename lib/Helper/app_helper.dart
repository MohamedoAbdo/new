import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tourism_app/features/svscreen/responsive_text.dart';
import 'package:tourism_app/models/Resturant_model.dart';

class AppHelper {
  static String selectedAnswer = '';
  static String userUuid = '';
  static String local = '';
  static List<RestaurantModel> myFavourit = [];

  static void setSelectedAnswer(String answer) {
    selectedAnswer = answer;
  }

  static void setUserUuid(String uuid) {
    userUuid = uuid;
  }

  static setLocal(Locale locale) {
    local = locale.languageCode;
  }

  static void addMyFavourit(List<RestaurantModel> list) {
    myFavourit.addAll(list);
  }

  //remove from favourit
  static void removeMyFavourit(RestaurantModel model) {
    myFavourit.removeWhere((element) => element.id == model.id);
  }

  static bool isINFavourit(RestaurantModel model) {
    return myFavourit.any((element) => element.id == model.id);
  }
}
