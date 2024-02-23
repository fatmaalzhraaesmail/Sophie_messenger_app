import 'package:flutter/material.dart';

@immutable
 class SocialauthState {}

 class SocialauthInitial extends SocialauthState {}

 class SocialauthSuccess extends SocialauthState {}

 // ignore: must_be_immutable
 class SocialauthFailaure extends SocialauthState {
  String error;
  SocialauthFailaure({required this.error});
}
 class SocialauthCancelled extends SocialauthState {
}
