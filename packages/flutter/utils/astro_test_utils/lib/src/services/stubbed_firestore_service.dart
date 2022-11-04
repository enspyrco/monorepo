import 'package:astro_types/json_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

class StubbedFirestoreService implements FirestoreService {
  StubbedFirestoreService({
    this.createDocumentReturns,
    this.deleteDocumentReturns,
    this.getDocumentsReturns,
    this.setDocumentReturns,
    this.tapIntoCollectionReturns,
    this.tapIntoDocumentReturns,
    this.updateDocumentReturns,
    this.createDocumentThrows,
    this.deleteDocumentThrows,
    this.getDocumentsThrows,
    this.setDocumentThrows,
    this.tapIntoCollectionThrows,
    this.tapIntoDocumentThrows,
    this.updateDocumentThrows,
  });

  final Future<String>? createDocumentReturns;
  final Future<void>? deleteDocumentReturns;
  final Future<List<Document>>? getDocumentsReturns;
  final Future<void>? setDocumentReturns;
  final Stream<List<Document>>? tapIntoCollectionReturns;
  final Stream<Document>? tapIntoDocumentReturns;
  final Future<void>? updateDocumentReturns;

  final Exception? createDocumentThrows;
  final Exception? deleteDocumentThrows;
  final Exception? getDocumentsThrows;
  final Exception? setDocumentThrows;
  final Exception? tapIntoCollectionThrows;
  final Exception? tapIntoDocumentThrows;
  final Exception? updateDocumentThrows;

  /// If a "<function>Throws" argument was used in the constructor the function
  /// will always throw the exception that was passed in.
  ///
  /// If a "<function>Returns" argument was used in the constructor (and the
  /// equivalent "<function>Throws" argument was not used) the function
  /// will return the value that was passed in.
  ///
  /// If neither the "<function>Throws" argument nor the "<function>Returns"
  /// arguments were set the function will throw an [UnimplementedError] if
  /// called during the test.
  @override
  Future<String> createDocument({required String at, required JsonMap from}) {
    if (createDocumentThrows != null) {
      throw createDocumentThrows!;
    }
    if (createDocumentReturns == null) {
      throw UnimplementedError();
    }
    return createDocumentReturns!;
  }

  @override
  Future<void> deleteDocument({required String at}) {
    if (deleteDocumentThrows != null) {
      throw deleteDocumentThrows!;
    }
    if (deleteDocumentReturns == null) {
      throw UnimplementedError();
    }
    return deleteDocumentReturns!;
  }

  @override
  Future<List<Document>> getDocuments(
      {required String at,
      Object? where,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isLessThan,
      Object? isLessThanOrEqualTo,
      Object? isGreaterThan,
      Object? isGreaterThanOrEqualTo,
      Object? arrayContains,
      List<Object?>? arrayContainsAny,
      List<Object?>? whereIn,
      List<Object?>? whereNotIn,
      bool? isNull}) {
    if (getDocumentsThrows != null) {
      throw getDocumentsThrows!;
    }
    if (getDocumentsReturns == null) {
      throw UnimplementedError();
    }
    return getDocumentsReturns!;
  }

  @override
  Future<void> setDocument(
      {required String at, required JsonMap to, bool merge = false}) {
    if (setDocumentThrows != null) {
      throw setDocumentThrows!;
    }
    if (setDocumentReturns == null) {
      throw UnimplementedError();
    }
    return setDocumentReturns!;
  }

  @override
  Stream<List<Document>> tapIntoCollection(
      {required String at,
      Object? where,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isLessThan,
      Object? isLessThanOrEqualTo,
      Object? isGreaterThan,
      Object? isGreaterThanOrEqualTo,
      Object? arrayContains,
      List<Object?>? arrayContainsAny,
      List<Object?>? whereIn,
      List<Object?>? whereNotIn,
      bool? isNull}) {
    if (tapIntoCollectionThrows != null) {
      throw tapIntoCollectionThrows!;
    }
    if (tapIntoCollectionReturns == null) {
      throw UnimplementedError();
    }
    return tapIntoCollectionReturns!;
  }

  @override
  Stream<Document> tapIntoDocument({required String at}) {
    if (tapIntoDocumentThrows != null) {
      throw tapIntoDocumentThrows!;
    }
    if (tapIntoDocumentReturns == null) {
      throw UnimplementedError();
    }
    return tapIntoDocumentReturns!;
  }

  @override
  Future<void> updateDocument({required String at, required JsonMap to}) {
    if (updateDocumentThrows != null) {
      throw updateDocumentThrows!;
    }
    if (updateDocumentReturns == null) {
      throw UnimplementedError();
    }
    return updateDocumentReturns!;
  }
}
