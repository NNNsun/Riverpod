import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manager/model/shopping_item_model.dart';
import 'package:manager/riverpods/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  // 두개의 상태를 동시에 listen
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);

  if (filterState == FilterState.all) {
    return shoppingListState;
  }
  return shoppingListState
      .where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
