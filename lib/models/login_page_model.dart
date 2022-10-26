import 'package:json_annotation/json_annotation.dart';
part 'login_page_model.g.dart';

@JsonSerializable()
class LogInModel{
  String? email;
  String? password;

  LogInModel({required this.email,required this.password});

  factory LogInModel.fromJson(Map<String, dynamic> json) => _$LogInModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogInModelToJson(this);

}