// lib/features/auth/login/data/models/token_model.dart
import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({required String token}) : super(token: token);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}