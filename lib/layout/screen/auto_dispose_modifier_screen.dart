import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manager/layout/default_layout.dart';
import 'package:manager/riverpods/auto_dispose_modifier.dart';

// 캐시가 필요없을 때 삭제하고 필요할때 다시 생성
// 현재 스크린에서 뒤로가기를 했을 경우 위젯이 삭제됨 -> 캐시 필요없음 -> 캐시도 삭제
// 장바구니 때 사용?
class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
