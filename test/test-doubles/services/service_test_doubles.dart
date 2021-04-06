import 'package:mockito/annotations.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/services/platform_service.dart';

@GenerateMocks([AuthService, DatabaseService, HttpService, PlatformService])
class ServiceTestDoubles {}
