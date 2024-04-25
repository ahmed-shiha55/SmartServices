import 'dart:io';
import 'dart:math';
import 'cubitState.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' show basename;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fullName;
  String? phone;
  String? type ='Customer';
  String? emailAddress;
  String? password;
  String? job;
  String? imgName;
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  File? imgPath;
  static AuthCubit getCubit(BuildContext context)=> BlocProvider.of(context);

//*-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-*
  Future<void> signUpWithEmailAndPassword() async {
    
    print('object');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      print('object');
     verifyEmail();
      await addUserProfile();

      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }

//*-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-**-*-*
  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(
          SignupFailureState(errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignupFailureState(errMessage: 'The email is invalid.'));
    } else {
      emit(SignupFailureState(errMessage: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

 sigInWithEmailAndPassword() async {
    print('object');
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      //print(FirebaseAuth.instance.currentUser!.uid);
      // await CacheHelper.saveCacheData(
      //     key: 'uid', val: '${FirebaseAuth.instance.currentUser!.uid}');

      print('objectx');
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailureState(errMessage: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SigninFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'FullName': fullName,
      'email': emailAddress,
      'phone': phone,
      'job': job,
      'type':type,
      'faviorteList': 0,
      'profileImage':
          'https://firebasestorage.googleapis.com/v0/b/swssss-98cc5.appspot.com/o/41_2023-638258273180448354-44.jpg?alt=media&token=b5ebacd9-fef0-4dc6-8d75-e100e16fbccf',
    });
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      print('empty');
    } else {
      print('done');
    }
  }

  // sign with google
  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleLoadingState());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(GooglefailedState(errMessage: 'Google Sign-In failed.'));
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      emit(GoogleSucesssState());
    } catch (e) {
      // Handle the error
      print('Error signing in with Google: $e');
      emit(GooglefailedState(errMessage: e.toString()));
    }

  //  uploadImage2Screen(ImageSource source) async {
  //   final pickedImg = await ImagePicker().pickImage(source: source);
  //   try {
  //     if (pickedImg != null) {

  //         imgPath = File(pickedImg.path);
  //         imgName = basename(pickedImg.path);
  //         int random = Random().nextInt(9999999);
  //         imgName = "$random$imgName";
  //         print(imgName);
  //     } else {
  //       print("NO img selected");
  //     }
  //   } catch (e) {
  //     print("Error => $e");
  //   }

  // }

//********************************************************************************************************************************** */

  }}