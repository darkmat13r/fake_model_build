import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:fake_model_generator/fake_model.dart';
import 'package:faker/faker.dart';

class FakeModelGenerator extends GeneratorForAnnotation<FakeModel> {
  Faker get faker => Faker();
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is ClassElement) {
      final className = element.name;
      final buffer = StringBuffer();

      buffer.writeln('class ${className}FakeFactory {');
      buffer.writeln('  static ${className} create() {');
      buffer.writeln('    return ${className}(');

      for (final field in element.fields) {
        final fieldType = field.type.toString();
        final fakeValue = _generateFakeValue(fieldType);
        buffer.writeln('      ${field.name}: $fakeValue,');
      }

      buffer.writeln('    );');
      buffer.writeln('  }');
      buffer.writeln('}');
      print("buffer.toString() ${buffer.toString()}");
      return buffer.toString();
    }
    return '';
  }

  String _generateFakeValue(String fieldType) {
    switch (fieldType) {
      case 'int':
        return '0';
      case 'double':
        return '0.0';
      case 'String':
        return "'test'";
      case 'bool':
        return 'false';
      // Add more types as needed
      default:
        return 'null';
    }
  }
}
