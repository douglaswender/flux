import 'package:flutter_test/flutter_test.dart';
import 'package:flux_client/app/modules/login/presentation/login_store.dart';

void main() {
  late LoginStore store;

  setUpAll(() {
    store = LoginStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
