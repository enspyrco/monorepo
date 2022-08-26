import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';
import '../../app-init/widgets/initial_page.dart';
import '../../auth/utils/login_configs.dart';
import '../../problems/pages/problem_page.dart';
import '../../profile/widgets/profile_page.dart';

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
void addPageTransforms<T extends RedFireState>(Widget homePage,
    ISet<LoginConfig> logins, ISet<PageDataTransforms> transforms) {
  // add the transforms from the child package
  // pageTransformMaps.addAll(transforms);
  for (var transform in transforms) {
    _fromJsonMap[transform.typeName] = transform.fromJson;
    toMaterialPageMap[transform.typeName] = transform.toMaterialPage;
  }

  // add the redfire toMaterialPage transforms
  toMaterialPageMap[InitialPageData.className] = (_) =>
      MaterialPage<InitialPage>(
          key: const ValueKey(InitialPage),
          child: InitialPage<T>(homePage, logins));
  toMaterialPageMap[ProfilePageData.className] = (_) =>
      MaterialPage<ProfilePage>(
          key: const ValueKey(ProfilePage), child: ProfilePage<T>());
  toMaterialPageMap[ProblemPageData.className] =
      (pageData) => ProblemPage<T>(info: (pageData as ProblemPageData).problem);

  // add the redfire fromJson transforms
  _fromJsonMap[InitialPageData.className] =
      (JsonMap json) => InitialPageData.fromJson(json);
  _fromJsonMap[ProfilePageData.className] =
      (JsonMap json) => ProfilePageData.fromJson(json);
  _fromJsonMap[ProblemPageData.className] =
      (JsonMap json) => ProblemPageData.fromJson(json);
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
