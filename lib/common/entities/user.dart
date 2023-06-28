import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photourl;
  final String? location;
  final String? fcmtoken;
  final Timestamp? addtime;

  UserData({
    this.id,
    this.name,
    this.email,
    this.photourl,
    this.location,
    this.fcmtoken,
    this.addtime,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserData(
      id: data?["id"],
      name: data?["name"],
      email: data?["email"],
      photourl: data?["photourl"],
      location: data?["location"],
      fcmtoken: data?["fcmtoken"],
      addtime: data?["addtime"],
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (id != null) "id": id,
        if (name != null) "name": name,
        if (email != null) "email": email,
        if (photourl != null) "photourl": photourl,
        if (location != null) "location": location,
        if (fcmtoken != null) "fcmtoken": fcmtoken,
        if (addtime != null) "addtime": addtime,
      };
}

class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    UserLoginResponseEntity(
      accessToken: json["access_token"],
      displayName: json["display_name"],
      email: json["email"],
      photoUrl: json["photoUrl"],
    );
  }
  Map<String, dynamic> toJson() => {
          "access_token": accessToken,
          "display_name": displayName,
          "email": email,
          "photoUrl": photoUrl,
        };
}