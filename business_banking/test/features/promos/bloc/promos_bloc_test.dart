import 'package:business_banking/features/promos/bloc/promos_bloc.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PromosBloc gets view model', () {
    final bloc = PromosBloc();

    bloc.promosViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<PromosViewModel>());
      expect(model.imageUrl, 'https://via.placeholder.com/300');
      expect(model.link, 'https://www.huntington.com/');
    }));
  });
}
