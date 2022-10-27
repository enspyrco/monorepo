import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:json_types/json_types.dart';

extension QueryDocumentSnapshotsExtension
    on List<QueryDocumentSnapshot<JsonMap>> {
  List<Document> toDocuments() {
    return map((doc) =>
            Document(id: doc.id, path: doc.reference.path, fields: doc.data()))
        .toList();
  }
}

extension DocumentSnapshotExtension on DocumentSnapshot<JsonMap> {
  Document toDocument() {
    return Document(id: id, path: reference.path, fields: data() ?? {});
  }
}
