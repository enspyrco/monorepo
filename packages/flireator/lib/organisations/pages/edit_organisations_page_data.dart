import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'edit_organisations_page_data.freezed.dart';
part 'edit_organisations_page_data.g.dart';

@freezed
class EditOrganisationsPageData extends PageData
    with _$EditOrganisationsPageData, ReduxModel {
  static const String staticTypeName = 'EditOrganisationsPageData';

  EditOrganisationsPageData._();
  factory EditOrganisationsPageData() = _EditOrganisationsPageData;

  factory EditOrganisationsPageData.fromJson(JsonMap json) =>
      _$EditOrganisationsPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}
