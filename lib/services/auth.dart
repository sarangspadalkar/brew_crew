import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  /// create user object based of Firebase Result

  User? _userFromFirebaseUser(firebase_auth.User? user) {
    return user != null ? User(uid: user.uid) : null;
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

  /** sign out */
}
