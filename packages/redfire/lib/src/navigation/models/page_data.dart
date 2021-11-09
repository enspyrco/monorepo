import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/app-init/widgets/initial_page.dart';
import 'package:redfire/src/auth/pages/other_auth_options_page.dart';
import 'package:redfire/src/auth/pages/other_auth_options_page_data.dart';
import 'package:redfire/src/auth/widgets/auth_page.dart';
import 'package:redfire/src/navigation/models/initial_page_data.dart';
import 'package:redfire/src/problems/pages/problem_page.dart';
import 'package:redfire/src/profile/widgets/profile_page.dart';
import 'package:redfire/types.dart';

import '../../types/typedefs.dart';

typedef PageDataFromJson = PageData Function(JsonMap json);
typedef PageFromPageData = Page Function(PageData pageData);

/// [RedFireState.pages] is a list of [PageData] and we use [PageDataConverter]
/// to add a 'type' key to the json during serialisation. The value stored
/// against the 'type' key is used to deserialise the json into the appropriate
/// object.
///
/// The value stored against the 'type' is the runtimeType of the member.
/// This means serialisation will only work when PageData is a member declared
/// with the @PageDataConverter() annotation.
abstract class PageData {
  const PageData();
  String get typeName;
  JsonMap toJson();
}

// final pageTransformMaps = <String, PageDataTransforms>{};
final toMaterialPageMap = <String, PageFromPageData>{};
final _fromJsonMap = <String, PageDataFromJson>{};

// should only be called once on app load
// TODO: create the redfire set without needing to call the function so there
// aren't separate steps that need to be discovered (eg. in tests)
// eg. when creating _fromJsonMap start with a map literal populated with the redfire
// fromJson functions (needs testing in place)
void addPageTransforms<T extends RedFireState>(
    Widget mainPage, List<PageDataTransforms> transforms) {
  // add the transforms from the child package
  // pageTransformMaps.addAll(transforms);
  for (var transform in transforms) {
    _fromJsonMap[transform.typeName] = transform.fromJson;
    toMaterialPageMap[transform.typeName] = transform.toMaterialPage;
  }

  // add the redfire toMaterialPage transforms
  toMaterialPageMap[InitialPageData.staticTypeName] = (_) =>
      MaterialPage<InitialPage>(
          key: const ValueKey(InitialPage),
          child: InitialPage<T>(AuthPage<T>(), mainPage));
  toMaterialPageMap[ProfilePageData.staticTypeName] = (_) =>
      MaterialPage<ProfilePage>(
          key: const ValueKey(ProfilePage), child: ProfilePage<T>());
  toMaterialPageMap[ProblemPageData.staticTypeName] =
      (pageData) => ProblemPage<T>(info: (pageData as ProblemPageData).problem);
  toMaterialPageMap[OtherAuthOptionsPageData.staticTypeName] = (pageData) =>
      MaterialPage<OtherAuthOptionsPage>(
          key: const ValueKey(OtherAuthOptionsPage),
          child: OtherAuthOptionsPage<T>());

  // add the redfire fromJson transforms
  _fromJsonMap[InitialPageData.staticTypeName] =
      (JsonMap json) => InitialPageData.fromJson(json);
  _fromJsonMap[ProfilePageData.staticTypeName] =
      (JsonMap json) => ProfilePageData.fromJson(json);
  _fromJsonMap[ProblemPageData.staticTypeName] =
      (JsonMap json) => ProblemPageData.fromJson(json);
  _fromJsonMap[OtherAuthOptionsPageData.staticTypeName] =
      (JsonMap json) => OtherAuthOptionsPageData.fromJson(json);
}

class PageDataTransforms {
  const PageDataTransforms(
      {required this.typeName,
      required this.toMaterialPage,
      required this.fromJson});
  final String typeName;
  final PageFromPageData toMaterialPage;
  final PageDataFromJson fromJson;
}

class PageDataConverter implements JsonConverter<PageData, JsonMap> {
  const PageDataConverter();

  @override
  PageData fromJson(JsonMap json) {
    final fromJson = _fromJsonMap[json['type']];
    if (fromJson == null) {
      throw Exception('No entry for \'type\' ${json['type']}');
    }
    return fromJson(json);
  }

  @override
  JsonMap toJson(PageData data) {
    final json = data.toJson();
    json['type'] = data.typeName;
    return json;
  }
}
