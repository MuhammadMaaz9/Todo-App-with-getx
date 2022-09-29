import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo extends GetxController {
  List<dynamic> items = [].obs;

  TextEditingController name = TextEditingController();
  TextEditingController editname = TextEditingController();

  addvalue() {
    items.add(name.text);
    name.clear();
  }

  delvalue(index) {
    items.removeAt(index);
  }
}
