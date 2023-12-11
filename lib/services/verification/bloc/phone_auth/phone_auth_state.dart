abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class ErrorOccurred extends PhoneAuthState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends PhoneAuthState{}

class PhoneOTPVerified extends PhoneAuthState{}
class PhoneFailure extends PhoneAuthState {
   String errorMessege;
  PhoneFailure({required this.errorMessege});
}
class PhoneError extends PhoneAuthState {
   String errorMessege;
  PhoneError({required this.errorMessege});
}
class verificationFailure extends PhoneAuthState {
   String errorMessege;
  verificationFailure({required this.errorMessege});
}