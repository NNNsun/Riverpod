import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manager/layout/default_layout.dart';
import 'package:manager/riverpods/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      // 기존 인덱스를 초기 인덱스로 지정
      initialIndex: ref.read(listenProvier),
    );
  }

  @override
  // 두번째 파라미터를 입력할 필요가 없음
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvier, ((previous, next) {
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    }));
    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(listenProvier.notifier).update((state) =>
                        state == controller.length - 1
                            ? controller.length - 1
                            : state + 1);
                  },
                  child: Text('다음')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvier.notifier)
                        .update((state) => state == 0 ? 0 : state - 1);
                  },
                  child: Text('뒤로')),
            ],
          ),
        ),
      ),
    );
  }
}
