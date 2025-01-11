import 'package:flutter/material.dart';

class Pages {
  final String? name;
  final Widget Function() func;

  Pages({this.name, required this.func});
}
