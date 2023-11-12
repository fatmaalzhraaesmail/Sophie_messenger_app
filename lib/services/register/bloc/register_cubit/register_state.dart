part of 'register_cubit.dart';

@immutable
 class RegisterState {}

 class RegisterInitial extends RegisterState {}

class LoginStart extends RegisterState {}

class LoginSuccess extends RegisterState {}

class LoginLoading extends RegisterState {}

class LoginFailure extends RegisterState {
  String errorMessage;
  LoginFailure({required this.errorMessage});
}
