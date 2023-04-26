import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:prolific/lib/utils/network_utils/custom_http_client.dart';
import 'package:prolific/lib/utils/network_utils/endpoints.dart';

class AuthService {
  final CustomHttpClient _customHttpClient = GetIt.I.get<CustomHttpClient>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;

      // Once signed in, return the UserCredential
      return await auth.signInWithCredential(credential);
    } catch (e) {
      // Handle the error
      print('An error occurred while signing in with Google: $e');
      rethrow;
    }
  }

  Future<UserCredential?> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      appleProvider.addScope('email');
      appleProvider.addScope('firstName');
      appleProvider.addScope('lastName');

      if (kIsWeb) {
        return await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        return await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }
    } catch (e) {
      // Handle the error
      print('An error occurred while signing in with Apple: $e');
      rethrow;
    }
  }

  Future<Response> sendTokenToBackend({String? token}) async {
    try {
      return await _customHttpClient
          .postRequest(path: loginPath, body: {'token': token});
    } catch (e) {
      // Handle the error
      print('An error occurred while sending the token to the backend: $e');
      rethrow;
    }
  }
}
