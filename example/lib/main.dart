import 'package:fake_model_generator/fake_model.dart';

void main() {
  final fakeModel = MyModelFakeFactory.create();
  print(fakeModel.name); // Output: fake_string
}
