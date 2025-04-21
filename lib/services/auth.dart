import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// sign ann

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print("Auth Error: ${e.toString()}");
      return null;
    }
  }

  /** sign email password */

  /** register email & password */

  /** sign out */
}
