import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'profile_page_data.freezed.dart';
part 'profile_page_data.g.dart';

@freezed
class ProfilePageData extends PageData with _$ProfilePageData, ReduxModel {
  static const String staticTypeName = 'ProfilePageData';

  ProfilePageData._();
  factory ProfilePageData() = _ProfilePageData;

  factory ProfilePageData.fromJson(JsonMap json) =>
      _$ProfilePageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}
