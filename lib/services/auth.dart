import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  User? _userFromFirebaseUser(firebase_auth.User? user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<User?> signInAnonymously() async {
    try {
      firebase_auth.UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print("Auth Error: ${e.toString()}");
      return null;
    }
  }

  /** sign email password */

  /** register email & password */
  Future<User?> registerUser(String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print("Register User Error: ${e.toString()}");
      return null;
    }
  }

  /** sign out */
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Sign Out Error: ${e.toString()}");
      return null;
    }
  }
}
