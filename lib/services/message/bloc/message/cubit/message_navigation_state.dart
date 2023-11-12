part of 'message_navigation_cubit.dart';

@immutable
 class MessageNavigationState {}

 class MessageNavigationInitial extends MessageNavigationState {}
 class ChangeMessageNavBarState extends MessageNavigationState {
  final int newIndex;

  ChangeMessageNavBarState(this.newIndex);
 }
