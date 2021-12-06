import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/pages/other_auth_options_page.dart';
import 'package:redfire/types.dart';

part 'other_auth_options_page_data.freezed.dart';
part 'other_auth_options_page_data.g.dart';

@freezed
class OtherAuthOptionsPageData extends PageData
    with _$OtherAuthOptionsPageData, ReduxState {
  static const String staticTypeName = 'OtherAuthOptionsPage';

  const OtherAuthOptionsPageData._();
  const factory OtherAuthOptionsPageData() = _OtherAuthOptionsPageData;

  factory OtherAuthOptionsPageData.fromJson(JsonMap json) =>
      _$OtherAuthOptionsPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}

class OtherAuthOptionsPageTransforms extends PageDataTransforms {
  OtherAuthOptionsPageTransforms()
      : super(
          typeName: OtherAuthOptionsPageData.staticTypeName,
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(OtherAuthOptionsPageData),
              child: OtherAuthOptionsPage()),
          fromJson: (json) => OtherAuthOptionsPageData.fromJson(json),
        );
}
