import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:mockito/mockito.dart';

/// Used to replace [Firebase.delegatePackingProperty] as a way provide mocks to
/// services that use the [Firebase.instance].
///
/// The usual method of wrapping [Firebase.instance] and injecting a mock
/// doesn't work because [Firebase] needs to be setup before the
/// [ReduxBundle] can be used.
class MockFirebasePlatform extends Mock implements FirebasePlatform {}
