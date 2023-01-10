import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/state_implementation_generator.dart';

Builder astroState(BuilderOptions options) =>
    SharedPartBuilder([StateImplementationGenerator()], 'subclass_generator');
