import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_clone/features/auth/domain/entities/app_user.dart';
import 'package:social_media_clone/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      //attempt sign in
      UserCredential userCredential = 
          await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      // fetch user document from firestore
      DocumentSnapshot userDoc = 
          await firebaseFirestore.collection('users').doc(userCredential.user!.uid).get();

      // create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name: userDoc['name']
      );

        //return user
        return user;
    } catch(e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password) async {
    try {
      //attempt sign up
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name: name
        );

        // save user data in firestore
        await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());

        //return user
        return user;
    } 
    //catch any errors
    catch(e) {
      throw Exception('Register failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    //if no user logged in
    if(firebaseUser == null) {
      return null;
    }

    // fetch user document from firestore
    DocumentSnapshot userDoc = await firebaseFirestore.collection("users").doc(firebaseUser.uid).get();

    //user exists
    return AppUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email!, 
      name: userDoc['name']
    );
  }
}