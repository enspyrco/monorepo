import 'package:mockito/annotations.dart';
import 'package:redfire/services.dart';

@GenerateMocks([AuthService, DatabaseService, PlatformService, HttpService])
class ServiceTestDoubles {}
