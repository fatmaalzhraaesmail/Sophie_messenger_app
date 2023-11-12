class VerificationRepo{
  Future<dynamic> verifyCode(Map<String,dynamic> data) async{
    return await Future.delayed(Duration(seconds: 2), () => "Done");
  }
  Future<dynamic> requestCode(Map<String,dynamic> data) async{
    return await Future.delayed(Duration(seconds: 2), () => "Done");
  }
}