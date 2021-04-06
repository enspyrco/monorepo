import 'package:redux/redux.dart';
import 'package:the_process/middleware/app_middleware.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/app_reducer.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/services/platform_service.dart';

import '../test-doubles/firebase/fake_firebase_auth.dart';
import '../test-doubles/firebase/fake_firebase_firestore.dart';
import '../test-doubles/http/fake_client.dart';
import '../test-doubles/wrappers/fake_platform_wrapper.dart';
import '../test-doubles/wrappers/fake_url_launcher_wrapper.dart';

/// The services default to real services with fake backends.
class StoreWithFakedServices extends Store<AppState> {
  StoreWithFakedServices({
    AuthService? authService,
    DatabaseService? databaseService,
    PlatformService? platformService,
    HttpService? httpService,
  }) : super(
          appReducer,
          initialState: AppState.init(),
          middleware: [
            ...createAppMiddleware(
                authService:
                    authService ?? AuthService(auth: FakeFirebaseAuth()),
                databaseService: databaseService ??
                    DatabaseService(database: FakeFirebaseFirestore()),
                platformService: platformService ??
                    PlatformService(
                        platformWrapper: FakePlatformWrapper(),
                        urlLauncherWrapper: FakeUrlLauncherWrapper()),
                httpService: HttpService(client: FakeHttpClient())),
          ],
        );
}
