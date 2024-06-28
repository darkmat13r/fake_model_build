import 'package:fake_model_generator/fake_model.dart';

part 'my_model.fake.dart';

@FakeModel()
class MyModel {
  final int id;
  final String name;
  final bool isActive;

  MyModel({required this.id, required this.name, required this.isActive});
}