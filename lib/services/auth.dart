import 'package:firebase_auth/firebase_auth.dart';
import 'package:urdunbasket/models/user.dart';
import 'package:urdunbasket/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Future<FirebaseUser> currentUser() async{
    return await FirebaseAuth.instance.currentUser();
  }

  //sign in anon
  Future signInAnon(String reason) async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateAnon(reason);
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  //sign in with email & password
  Future signInWithEmailAndPassowrd(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassowrd(String email, String password, String name, String phoneNumber, int type) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      user.updateProfile(userUpdateInfo);

      await DatabaseService(uid: user.uid).updateUserData(name, phoneNumber, email, type);
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      //print(e.toString());
      return null;
    }
  }
}