import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String accessToken, })
      : super(accessToken: accessToken);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['data']["token"],
    );
  }
}