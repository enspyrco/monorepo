import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/subclass_generator.dart';

Builder astroState(BuilderOptions options) =>
    SharedPartBuilder([SubclassGenerator()], 'subclass_generator');
