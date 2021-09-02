import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/app-init/widgets/initial_page.dart';
import 'package:redfire/src/auth/widgets/auth/auth_page.dart';
import 'package:redfire/src/navigation/models/initial_page_data.dart';
import 'package:redfire/types.dart';

import '../../types/typedefs.dart';

typedef PageDataFromJson = PageData Function(JsonMap json);
typedef PageFromPageData = MaterialPage Function(PageData pageData);

/// [RedFireState.pages] is a list of [PageData] and we use [PageDataConverter]
/// to add a 'type' key to the json during serialisation. The value stored
/// against the 'type' key is used to deserialise the json into the appropriate
/// object.
///
/// The value stored against the 'type' is the runtimeType of the member.
/// This means serialisation will only work when PageData is a member declared
/// with the @PageDataConverter() annotation.
abstract class PageData {
  String get typeName;
  JsonMap toJson();
}

// final pageTransformMaps = <String, PageDataTransforms>{};
final toMaterialPageMap = <String, PageFromPageData>{};
final _fromJsonMap = <String, PageDataFromJson>{};

// should only be called once on app load
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
  toMaterialPageMap[InitialPageData.staticTypeName] = (_) =>
      MaterialPage<InitialPage>(
          key: const ValueKey(InitialPage),
          child: InitialPage<T>(AuthPage<T>(), mainPage));
  toMaterialPageMap[InitialPageData.staticTypeName] = (_) =>
      MaterialPage<InitialPage>(
          key: const ValueKey(InitialPage),
          child: InitialPage<T>(AuthPage<T>(), mainPage));

  // add the redfire fromJson transforms
  _fromJsonMap[InitialPageData.staticTypeName] =
      (JsonMap json) => InitialPageData.fromJson(json);
  _fromJsonMap[InitialPageData.staticTypeName] =
      (JsonMap json) => InitialPageData.fromJson(json);
  _fromJsonMap[InitialPageData.staticTypeName] =
      (JsonMap json) => InitialPageData.fromJson(json);
}

class PageDataTransforms {
  PageDataTransforms(this.typeName, this.toMaterialPage, this.fromJson);
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
