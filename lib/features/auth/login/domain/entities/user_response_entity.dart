import 'user_entity.dart';

class UserResponseEntity {
  final UserEntity user;
  final String token;
  final String userId;
  final int expires;

  const UserResponseEntity({
    required this.user,
    required this.token,
    required this.userId,
    required this.expires,
  });
}
