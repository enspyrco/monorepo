import 'dart:async';

import 'package:redux_devtools_screen/redux_devtools_screen.dart';

final reduxEventsController = StreamController<ReduxStateEvent>.broadcast();
