import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/services/database_service.dart';

class FakeDatabaseService extends Fake implements DatabaseService {
  @override
  Map<DatabaseSection, StreamSubscription> subscriptions;
}

class MockDatabaseService extends Mock implements DatabaseService {}
