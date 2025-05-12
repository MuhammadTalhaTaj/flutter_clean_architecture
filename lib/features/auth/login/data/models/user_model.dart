import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String accessToken, required String refreshToken})
      : super(accessToken: accessToken, refreshToken: refreshToken);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}