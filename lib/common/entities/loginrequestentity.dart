class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? accessToken;
  int? online;

  LoginRequestEntity({
    this.type,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.accessToken,
    this.online,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "open_id": accessToken,
    "online": online,
  };
}
