abstract class PhoneState {}
class PhoneInitialState extends PhoneState {}
class PhoneSuccess extends PhoneState {
 
}

class PhoneFailure extends PhoneState {
   String errorMessege;
  PhoneFailure({required this.errorMessege});
}
class PhoneError extends PhoneState {
   String errorMessege;
  PhoneError({required this.errorMessege});
}