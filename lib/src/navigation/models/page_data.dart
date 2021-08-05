import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/app-init/widgets/initial_page.dart';
import 'package:redfire/src/auth/widgets/auth/auth_page.dart';
import 'package:redfire/src/navigation/models/initial_page_data.dart';
import 'package:redfire/src/navigation/models/problem_page_data.dart';
import 'package:redfire/src/navigation/models/profile_page_data.dart';
import 'package:redfire/src/problems/widgets/problem_page.dart';
import 'package:redfire/src/profile/widgets/profile_page.dart';
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
  JsonMap toJson();
}

class PageDataTransforms {
  PageDataTransforms(this.type, this.toMaterialPage, this.fromJson);
  final Type type;
  final PageFromPageData toMaterialPage;
  final PageDataFromJson fromJson;
}

class PageDataMaps<T extends RedFireState> {
  static final Map<String, PageFromPageData> pageDataToPage = {};
  static final Map<String, PageDataFromJson> pageDataFromJson = {};

  PageDataMaps(Widget mainPage, List<PageDataTransforms> pageTransforms) {
    pageDataToPage['_\$_InitialPageData'] = (_) => MaterialPage<InitialPage>(
        key: const ValueKey(InitialPage),
        child: InitialPage<T>(AuthPage<T>(), mainPage));
    pageDataToPage['_\$_ProfilePageData'] = (_) => MaterialPage<ProfilePage>(
        key: const ValueKey(ProfilePage), child: ProfilePage<T>());
    pageDataToPage['_\$_ProblemPageData'] = (pageData) =>
        MaterialPage<ProblemPage>(
            key: const ValueKey(ProblemPage),
            child: ProblemPage<T>((pageData as ProblemPageData).problem));

    pageDataFromJson['_\$_InitialPageData'] =
        (JsonMap json) => InitialPageData.fromJson(json);
    pageDataFromJson['_\$_ProfilePageData'] =
        (JsonMap json) => ProfilePageData.fromJson(json);
    pageDataFromJson['_\$_ProblemPageData'] =
        (JsonMap json) => ProblemPageData.fromJson(json);

    for (final transform in pageTransforms) {
      pageDataToPage['_\$_${transform.type}'] = transform.toMaterialPage;
      pageDataFromJson['_\$_${transform.type}'] = transform.fromJson;
    }
  }
}

class PageDataConverter implements JsonConverter<PageData, JsonMap> {
  const PageDataConverter();

  @override
  PageData fromJson(JsonMap json) {
    final fromJson = PageDataMaps.pageDataFromJson[json['type']];
    if (fromJson == null) {
      throw Exception('No entry for \'type\' ${json['type']}');
    }
    return fromJson(json);
  }

  @override
  JsonMap toJson(PageData data) {
    final json = data.toJson();
    json['type'] = data.runtimeType.toString();
    return json;
  }
}
