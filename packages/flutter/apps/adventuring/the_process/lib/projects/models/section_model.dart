import 'package:astro_types/state_types.dart';

class SectionModel with AstroState {
  SectionModel({
    required this.name,
    required this.folderId,
    required this.useCasesDocId,
  });

  final String name;
  final String folderId;
  final String useCasesDocId;

  @override
  SectionModel copyWith({
    String? name,
    String? folderId,
    String? useCasesDocId,
  }) =>
      SectionModel(
        name: name ?? this.name,
        folderId: folderId ?? this.folderId,
        useCasesDocId: useCasesDocId ?? this.useCasesDocId,
      );

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        name: json['json'],
        folderId: json['folderId'],
        useCasesDocId: json['useCasesDocId'],
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
