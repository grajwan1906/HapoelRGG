import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urdunbasket/services/auth.dart';

class DatabaseService {

  String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference _userCollection = Firestore.instance.collection('users');
  final CollectionReference _ridesBoardCollection = Firestore.instance.collection('ridesBoard');
  final CollectionReference _invitationGameCollection = Firestore.instance.collection('invitationGame');


  void updateUid(){
    final AuthService _auth = AuthService();
    _auth.currentUser().then((result) {
        uid = result.uid;
    });
  }

  Future updateUserData(String name, String phoneNumber, String email, int type) async {
    return await _userCollection.document(uid).setData({
      'name' : name,
      'phone number' : phoneNumber,
      'email' : email,
      'type' : type
    });
  }

  Future updateRide(String returnAlso, String numberOfPeople, String name, String uid, String phoneNumber, String looking, String address) async {
    return await _ridesBoardCollection.document(uid).setData({
      'name' : name,
      'phoneNumber' : phoneNumber,
      'returnAlso' : returnAlso,
      'uid' : uid,
      'numberOfPeople' : numberOfPeople,
      'looking' : looking,
      'address' : address
    });
  }

  Future addInvitationToTheGame(String name, String school, String phoneNumber, String email, String numberOfChildren) async {
    return await _invitationGameCollection.document(uid).setData({
      'name' : name,
      'school' : school,
      'phoneNumber' : phoneNumber,
      'email' : email,
      'numberOfChildren' : numberOfChildren,
    });
  }

  Future updateAnon(String reason) async {
    return await _userCollection.document(uid).setData({
      'reason' : reason,
      'type' : '0'
    });
  }

  Future<void> deleteRide(String uid){
    return _ridesBoardCollection.document(uid).delete();
  }

  Future<void> deleteInvitations(){
    _invitationGameCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }
}