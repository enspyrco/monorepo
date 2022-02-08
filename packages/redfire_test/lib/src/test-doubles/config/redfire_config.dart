import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/utils.dart';

import 'redfire_config.mocks.dart';

@GenerateMocks([RedFireConfig, FirebaseOptions])
class RedFireConfigTestDouble {
  static MockRedFireConfig get basic {
    var mockConfig = MockRedFireConfig();
    var mockOptions = MockFirebaseOptions();

    when(mockConfig.firebase).thenReturn(mockOptions);

    return mockConfig;
  }
}
