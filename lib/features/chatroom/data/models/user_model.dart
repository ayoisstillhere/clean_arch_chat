import 'package:clean_arch_chat/features/chatroom/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String uid,
    required String profileUrl,
  }) : super(name, email, uid, profileUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
      profileUrl: json['profileUrl'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: (documentSnapshot.data()! as dynamic)['name'],
      email: (documentSnapshot.data()! as dynamic)['email'],
      uid: (documentSnapshot.data()! as dynamic)['uid'],
      profileUrl: (documentSnapshot.data()! as dynamic)['profileUrl'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "profileUrl": profileUrl,
    };
  }
}
