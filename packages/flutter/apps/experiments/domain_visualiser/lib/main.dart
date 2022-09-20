import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/utils.dart';
import 'package:redfire/widgets.dart';

import 'app_state.dart';
import 'middleware/add_domain_object_middleware.dart';
import 'middleware/tap_domain_objects_middleware.dart';
import 'middleware/update_domain_object.dart';
import 'reducers/set_domain_objects.dart';
import 'widgets/drawing_page.dart';

void main() => runApp(AppWidget<AppState>(
      config: RedFireOptions.currentPlatform,
      logins: {
        EmailLoginConfig(),
        PlatformDefaultLoginConfig(clientId: RedFireOptions.web.auth.clientId!),
      }.lock,
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: [
        AddDomainObjectMiddleware(),
        TapDomainObjectsMiddleware(),
        UpdateDomainObjectMiddleware(),
      ],
      reducers: [
        SetDomainObjectsReducer(),
      ],
      pageTransforms: ISet(),
      title: 'Domain Visualiser',
      homePage: const DrawingPage(), // shown on successful authentication
    ));
