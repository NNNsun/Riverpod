import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manager/model/shopping_item_model.dart';

//<어떤 notifier인지, 해당 notifier가 관리하는 state의 타입>
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

//extends StateNotifier는 기본! StateNotifier는 상태관리 할 타입을 명시해줘야함!
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  //생성자
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '수박', quantity: 2, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '카스테라', quantity: 5, hasBought: false, isSpicy: false),
        ]);

  void toggleHasBought({required String name}) {
    //StateNotifier에 존재하며 super값으로 자동 초기화
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
