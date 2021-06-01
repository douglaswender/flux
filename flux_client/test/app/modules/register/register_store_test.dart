import 'package:flutter_test/flutter_test.dart';
import 'package:flux_client/app/modules/register/register_store.dart';
 
void main() {
  late RegisterStore store;

  setUpAll(() {
    store = RegisterStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}