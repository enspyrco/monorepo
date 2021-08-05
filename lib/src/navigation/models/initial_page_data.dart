import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';

part 'initial_page_data.freezed.dart';
part 'initial_page_data.g.dart';

@freezed
class InitialPageData extends PageData with _$InitialPageData {
  factory InitialPageData() = _InitialPageData;

  factory InitialPageData.fromJson(Map<String, Object?> json) =>
      _$InitialPageDataFromJson(json);
}
