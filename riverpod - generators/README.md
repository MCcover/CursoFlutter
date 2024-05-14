## Getting Started

These packages must be installed

```
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

### Once installed, execute the following command
```
flutter pub run build_runner watch
```

### Example Provider creation:
Create a file: test_provider.dart

```
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_provider.g.dart';

@riverpod
String test(TestRef ref) {
	return "Test";
}
```

The command executed previously, whenever it detects a change in the provider, will perform a code generation.

For more references, refer to the examples.