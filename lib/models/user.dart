part of 'models.dart';

class User extends Equatable {
  User({
    this.userId,
    this.name,
    this.ktp,
    this.telp,
    this.email,
    this.appLogin,
  });

  int userId;
  String name;
  String ktp;
  String telp;
  String email;
  int appLogin;

  User copyWith({
    int userId,
    String name,
    String ktp,
    String telp,
    String email,
    int appLogin,
  }) =>
      User(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        ktp: ktp ?? this.ktp,
        telp: telp ?? this.telp,
        email: email ?? this.email,
        appLogin: appLogin ?? this.appLogin,
      );

  factory User.fromJson(Map<String, dynamic> data) => User(
        userId: data['userId'],
        name: data['name'],
        email: data['email'],
        ktp: data['ktp'],
        telp: data['telp'],
        appLogin: data['app_login'],
      );

  @override
  List<Object> get props => [userId, name, email, ktp, telp, appLogin];
}
