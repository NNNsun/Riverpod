import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  // 업데이트 시 무조건 실행
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        '[Provider Updated] provider: $provider / pv: $previousValue / nv: $newValue');
  }

  // provide가 생성되었을 때 실행
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider: $provider / value: $value ');
  }

  // provide가 삭제되었을 때 실행
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    print('[Provider Disposed] provider: $provider ');
  }
}
