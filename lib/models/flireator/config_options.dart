import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_options.freezed.dart';
part 'config_options.g.dart';

@freezed
class ConfigOptions with _$ConfigOptions {
  factory ConfigOptions({required String orgName}) = _ConfigOptions;

  factory ConfigOptions.fromJson(Map<String, dynamic> json) =>
      _$ConfigOptionsFromJson(json);
}
