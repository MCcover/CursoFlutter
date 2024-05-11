## Getting Started

Ejecutar el build runner

Se deben instalar estos paquetes

```
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

### Una vez instalados se debe ejecutar el siguiente comando
```
flutter pub run build_runner watch
```

### Ej creación de Provider:
Crear un archivo: test_provider.dart

```
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_provider.g.dart';

@riverpod
String test(TestRef ref) {
	return "Test";
}
```

El comando ejecutado anteriormente cada vez que detecte un cambio en el provider va a realizar una generacion de codigo.

Para mas referencias, dirigirse a los ejemplos.