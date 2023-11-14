import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppTextStyles {
  /// - weight: w100
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w100 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  /// - weight: w200
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w200 =
      TextStyle(fontWeight: FontWeight.w200, color: Colors.black);

  /// - weight: w300
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w300 =
      TextStyle(fontWeight: FontWeight.w400, color: Colors.white);

  /// - weight: w400
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w400 =
      TextStyle(fontWeight: FontWeight.w400, color: Colors.white,fontSize: 19);

  /// - weight: w500
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w500 =
      TextStyle(fontWeight: FontWeight.w500, color: Colors.white,fontSize: 18);

  /// - weight: w600
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w600 =
      TextStyle(fontWeight: FontWeight.w600, color: Colors.white,fontSize: 18);

  /// - weight: w700
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w700 =
      TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16);

  /// - weight: w800
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w800 =
      TextStyle(fontWeight: FontWeight.w800, color: Colors.black);

  /// - weight: w900
  /// - family: inter
  /// - color: black `(default)`
  static const TextStyle w900 =
      TextStyle(fontWeight: FontWeight.w900, color: Colors.black);
  static Color maincolor = HexColor("#2cb9b0");
  // 56cfca
  
  static TextStyle appBar =TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16);
   static TextStyle unread = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Colors.black
   );
   static TextStyle read = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Colors.black
   );
    static TextStyle readmessage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.grey.shade500,
   );
    static TextStyle unreadmessage = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Colors.black,
   );
}
