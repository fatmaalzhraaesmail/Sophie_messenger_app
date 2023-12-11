import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/continue_setup/bloc/state.dart';
import 'package:sophie_messenger_app/services/verification/bloc/email_verification_cubit.dart';

enum Gender { Male, Female }

class ContinueSetupCubit extends Cubit<ContinueSetupState> {
  ContinueSetupCubit(this.emailverification)
      : super(ContinueSetupIntialState());
  static ContinueSetupCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  EmailVerificationCubit emailverification=EmailVerificationCubit();

  void selectCard(int index) {
    selectedIndex = index;
    emit(ContinueSetupSelectedGenderSuccessState());
  }

  String gender = '';
  Future<void> chooseGender({required int index}) async {
    emit(ContinueSetupSelectedGenderState());
    try {
      if (index == 0) {
        gender = "Male";
      } else {
        gender = "Female";
      }
      DocumentReference userRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString());
      userRef.update({"gender": gender}).then((value) {
        print("Field updated successfully");
        //hint before phone
        CustomNavigator.push(Routes.navigation);
        
      }).catchError((error) {
        print("Failed to update field: $error");
      });

      emit(ContinueSetupSelectedGenderSuccessState());
    } on FirebaseAuthException catch (ex) {
      print("something went Wrong");
    }
  }
}
