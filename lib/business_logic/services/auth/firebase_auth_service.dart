import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:start_app/business_logic/services/auth/auth_service_interface.dart';

class FirebaseAuthService implements IAuthService {

  String _verificationId;

  Future<bool> isUserAuthorized() => FirebaseAuth.instance
      .currentUser()
      .then((FirebaseUser user) => user != null, onError: (error) => false);

  void requestVerificationCode(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _verificationCodeSent,
        codeAutoRetrievalTimeout: _autoRetrievalTimeout);
  }

  Future<bool> verifyCode(String verificationCode) async {
    final AuthCredential credentials = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: verificationCode);
    final bool success = await _signInWithCredentials(credentials);

    return success;
  }

  Future<bool> _signInWithCredentials(AuthCredential credentials) async {
    AuthResult result;
    // firebase throws platform exception in case of wrong code, so we use custom handler there
    try {
      result = await FirebaseAuth.instance.signInWithCredential(credentials);
    } on PlatformException catch (ex) {
      // TODO: handle invalid code exceptions;
    }
    return result != null && result.user != null;
  }

  Future<void> _verificationCompleted(AuthCredential credentials) async {
    if (await _signInWithCredentials(credentials)) {
      // TODO: implement signing
    }
  }

  Future<void> _verificationCodeSent(String verificationID,
      [int forceResendingToken]) async {
    _verificationId = verificationID;
  }

  void _autoRetrievalTimeout(String verificationID) {
    _verificationId = verificationID;
  }

  void _verificationFailed(AuthException authException) {
    // TODO: handle exceptions
  }
}
