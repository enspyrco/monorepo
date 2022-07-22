import 'package:mockito/annotations.dart';
import 'package:redfire/services.dart';

@GenerateMocks(
    [AuthService, FlutterfireFirestoreService, PlatformService, HttpService])
class ServiceTestDoubles {}
