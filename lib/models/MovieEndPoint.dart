
import 'package:flutter/material.dart';

class MovieEndPoint extends ChangeNotifier{

  String endpoint = "upcoming";

  changeEndPoint(String url){
    endpoint = url;
    notifyListeners();
  }

}