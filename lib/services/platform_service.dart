import 'package:flireator/utils/git_hub_redirect.dart' as git_hub_redirect;
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  PlatformService();

  Future<void> launchGitHubAuth({required String state}) async {
    final url = git_hub_redirect.uriWith(state: state).toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
