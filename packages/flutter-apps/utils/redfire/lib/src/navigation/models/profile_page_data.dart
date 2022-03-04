import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../types.dart';

part 'profile_page_data.freezed.dart';
part 'profile_page_data.g.dart';

@freezed
class ProfilePageData extends PageData with _$ProfilePageData, ReduxState {
  static const String className = 'ProfilePageData';

  const ProfilePageData._();
  const factory ProfilePageData() = _ProfilePageData;

  factory ProfilePageData.fromJson(JsonMap json) =>
      _$ProfilePageDataFromJson(json);

  @override
  String get typeName => className;
}
