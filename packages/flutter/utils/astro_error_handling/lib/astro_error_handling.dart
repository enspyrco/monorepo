library astro_error_handling;

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import 'src/routes/error_report/error_report_page_state.dart';
import 'src/routes/error_report/error_report_screen.dart';

export 'src/exceptions/astro_exception.dart';
export 'src/implementations/error_handlers_implementation/default_error_handlers.dart';
export 'src/missions/create_error_report.dart';
export 'src/routes/error_report/error_report_page.dart';
export 'src/routes/error_report/error_report_page_state.dart';
export 'src/routes/error_report/error_report_screen.dart';
export 'src/state/models/error_handling_state.dart';
export 'src/state/models/error_report.dart';

void initializeErrorHandling<S extends AstroState>() {
  locate<PageGenerator>().add(
    type: ErrorReportPageState,
    generator: (state) => MaterialPage(
      child: ErrorReportScreen<S>((state as ErrorReportPageState).report),
    ),
  );
}
