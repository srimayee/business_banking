import 'package:business_banking/features/promos/bloc/promos_bloc.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PromosBloc gets view model', () {
    final bloc = PromosBloc();

    bloc.promosViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<PromosViewModel>());
      expect(model.imageUrl,
          'http://placehold.jp/24/228B22/006400/300x300.jpg?text=a%20promo%20will%20be%20displayed%20here');
      expect(model.link, 'https://www.huntington.com/');
    }));
  });
}
