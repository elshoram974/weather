import 'dart:convert';

import 'package:flutter/material.dart';

class Condition {
  final String text;
  final String icon;
  final int code;
  String get assetsIcon =>
      icon.replaceAll('//cdn.weatherapi.com', 'assets/pic');

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  MaterialColor? get color {
    switch (text) {
      case 'Sunny':
        return Colors.yellow;
      case 'Clear':
        return Colors.green;
      // case 'Sunny': return Colors.yellow;
      // case 'Sunny': return Colors.yellow;
      // case 'Sunny': return Colors.yellow;

      default:
        return null;
    }
  }

  Condition copyWith({
    String? text,
    String? icon,
    int? code,
  }) =>
      Condition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  factory Condition.newEmpty() => Condition(text: '', icon: '', code: 0);
  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}
