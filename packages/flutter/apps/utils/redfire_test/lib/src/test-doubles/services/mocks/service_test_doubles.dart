import 'package:mockito/annotations.dart';
import 'package:redfire/services.dart';

@GenerateMocks(
    [AuthService, FirestoreServiceFlutterfire, PlatformService, HttpService])
class ServiceTestDoubles {}
