import 'package:build/build.dart';
import 'fake_model_generator.dart';
import 'package:source_gen/source_gen.dart';
Builder fakeModelGeneratorFactory(BuilderOptions options) => 
    SharedPartBuilder([FakeModelGenerator()], 'fake_model');
