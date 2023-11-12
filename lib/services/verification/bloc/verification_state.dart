abstract class verificationState {}
class verificationInitialState extends verificationState {}
class verificationSuccess extends verificationState {
  String errorMessege;
  verificationSuccess({required this.errorMessege});
}

class verificationFailure extends verificationState {
   String errorMessege;
  verificationFailure({required this.errorMessege});
}
class VerificationError extends verificationState {
   String errorMessege;
  VerificationError({required this.errorMessege});
}
