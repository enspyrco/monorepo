import 'package:astro_types/core_types.dart';

class DefaultSystemChecks implements SystemChecks {
  DefaultSystemChecks();

  @override
  final List<SystemCheck> preLaunch = [];
  @override
  final List<SystemCheck> postLaunch = [];
  @override
  final List<SystemCheck> preLand = [];
  @override
  final List<SystemCheck> postLand = [];
}
