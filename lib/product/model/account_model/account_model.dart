import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "status", fromJson: _boolFromInt, toJson: _intFromBool)
  final bool status;
  final UserDetail userDetail;

  AccountModel({
    this.username = "Bilinmiyor",
    required this.email,
    this.status = false,
    required this.userDetail,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        username: json['user']['username'] ?? "Bilinmiyor",
        email: json['user']['email'] ?? "Bilinmiyor",
        status: _boolFromInt(json['user']['status'] ?? 0),
        userDetail: UserDetail.fromJson(json['userDetail']),
      );

  Map<String, dynamic> toJson() => {
        'user': {
          'username': username,
          'email': email,
          'status': _intFromBool(status),
        },
        'userDetail': userDetail.toJson(),
      };

  static bool _boolFromInt(int value) => value == 1;
  static int _intFromBool(bool value) => value ? 1 : 0;
}

@JsonSerializable()
class UserDetail {
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(fromJson: _stringToInt, toJson: _intToString)
  final int phone;
  final String city;
  final String district;
  final String address;

  UserDetail({
    this.fullName = "Bilinmiyor",
    this.phone = 0,
    this.city = "Bilinmiyor",
    this.district = "Bilinmiyor",
    this.address = "Bilinmiyor",
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  static int _stringToInt(String value) => int.tryParse(value) ?? 0;
  static String _intToString(int value) => value.toString();
}
