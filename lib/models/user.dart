import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String login;
  late num id;
  late String avatar_url;
  late String url;
  late String type;
  late bool site_admin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  num? public_repos;
  num? public_gists;
  num? followers;
  num? following;
  String? created_at;
  String? updated_at;
  num? total_private_repos;
  num? owned_private_repos;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
