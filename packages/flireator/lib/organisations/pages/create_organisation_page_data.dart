import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_organisation_page_data.freezed.dart';
part 'create_organisation_page_data.g.dart';

@freezed
class CreateOrganisationPageData extends PageData
    with _$CreateOrganisationPageData, ReduxModel {
  static const String staticTypeName = 'CreateOrganisationPageData';

  CreateOrganisationPageData._();
  factory CreateOrganisationPageData() = _CreateOrganisationPageData;

  factory CreateOrganisationPageData.fromJson(JsonMap json) =>
      _$CreateOrganisationPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}
