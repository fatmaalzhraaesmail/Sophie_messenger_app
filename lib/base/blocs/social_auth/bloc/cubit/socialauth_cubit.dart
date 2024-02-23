import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sophie_messenger_app/base/blocs/social_auth/bloc/cubit/socialauth_state.dart';
import 'package:sophie_messenger_app/base/models/user_model.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';

class SocialauthCubit extends Cubit<SocialauthState> {
  SocialauthCubit() : super(SocialauthInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> signUpWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

    if (userSnapshot.exists) {
      // User already exists, return their account data
      final userData = userSnapshot.data();
      print('User already exists: $userData');
      CustomNavigator.push(Routes.navigation);
    } else {
      await _saveUserData(userCredential.user!);
      print('New user created: ${userCredential.user!.uid}');
      CustomNavigator.push(Routes.login);

       
    }


    emit(SocialauthSuccess());
  } catch (e) {
    print(e.toString());
    emit(SocialauthFailaure(error: 'Something Went Wrong!'));
  }
}

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> _saveUserData(User user) async {
    final userModel = UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      image: user.photoURL,
      gender: '',
      isVerified: true,
      phone: ''
    );

    await _usersCollection.doc(user.uid).set(userModel.toJson());
  }

 Future<void> signUpWithFacebook() async {
  try {
    List<String> permissions = ['public_profile', 'email'];
    final LoginResult result = await FacebookAuth.instance.login(
        permissions: permissions, loginBehavior: LoginBehavior.dialogOnly);
    print(result);
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();

      if (userSnapshot.exists) {
        // User already exists, return their account data
        final userData = userSnapshot.data();
        print('User already exists: $userData');
        
      CustomNavigator.push(Routes.navigation);
      } else {
        // User does not exist, create a new account
        await _saveUserDataFacebook(userCredential.user!);
        print('New user created: ${userCredential.user!.uid}');
      
        CustomNavigator.push(Routes.login);
      }

    

      emit(SocialauthSuccess());
    } else if (result.status == LoginStatus.cancelled) {
      emit(SocialauthCancelled());
    } else {
      emit(SocialauthFailaure(error: 'Something Went Wrong!'));
    }
  } catch (e) {
    print(e.toString());
    emit(SocialauthFailaure(error: e.toString()));
  }
}
  Future<void> signOutFaceBook() async {
    await _auth.signOut();
  }

  Future<void> _saveUserDataFacebook(User user) async {
    final userModel = UserModel(

      name: user.displayName ?? '',
      email: user.email ?? '',
      image: user.photoURL,
      gender: '',
      isVerified: true,
      phone: ''
    );

    await _usersCollection.doc(user.uid).set(userModel.toJson());
  }
}
