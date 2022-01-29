import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hack/database/methods/auth/storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up with email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String UserType,
    required String UserPhone,
    required String UserCollege,
    // required Uint8List UserImageUrl,
  }) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              userName.isNotEmpty ||
              UserType.isNotEmpty ||
              UserPhone.isNotEmpty ||
              UserCollege.isNotEmpty
          // || UserImageUrl != null
          ) {
        //reg user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

// picture
        // String photoURL = await StorageMethods()
        //     .uploadImageToStorage('profilePics', UserImageUrl);

        //add user
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'userName': userName,
          'email': email,
          'userType': UserType,
          'userPhone': UserPhone,
          'userCollege': UserCollege,
          // 'userImageUrl': photoURL,
          'userFavEvent': [],
          'userOrders': [],
        });
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      } else {
        res = e.code;
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
