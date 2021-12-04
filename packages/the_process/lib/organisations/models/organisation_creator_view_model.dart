import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisation_creator_view_model.freezed.dart';
part 'organisation_creator_view_model.g.dart';

@freezed
class OrganisationCreatorViewModel
    with _$OrganisationCreatorViewModel, ReduxModel {
  static const String className = 'OrganisationCreatorViewModel';

  const OrganisationCreatorViewModel._();
  factory OrganisationCreatorViewModel({
    /// The organisaiton name
    @Default('') String name,

    /// Are we currently creating a new organisation?
    @Default(false) bool creating,
  }) = _OrganisationCreatorViewModel;

  factory OrganisationCreatorViewModel.fromJson(JsonMap json) =>
      _$OrganisationCreatorViewModelFromJson(json);

  @override
  String get typeName => className;
}
