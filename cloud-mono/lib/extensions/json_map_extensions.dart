import 'package:coding_challenge_verifier/utils/type_utils.dart';

extension JsonMapExtension on JsonMap {
  bool get isFromACompletedJobEvent =>
      this['workflow_job'] != null && this['action'] == 'completed';
}
