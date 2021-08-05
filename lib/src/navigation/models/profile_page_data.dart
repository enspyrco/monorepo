import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';

part 'profile_page_data.freezed.dart';
part 'profile_page_data.g.dart';

@freezed
class ProfilePageData extends PageData with _$ProfilePageData {
  factory ProfilePageData() = _ProfilePageData;

  factory ProfilePageData.fromJson(Map<String, Object?> json) =>
      _$ProfilePageDataFromJson(json);
}
