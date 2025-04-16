import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:notas/core/routes/app_router.dart';
import 'package:notas/presentation/components/common/loading_wrapper.dart';
import 'package:notas/presentation/controllers/loading_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = router();

    return KeyboardVisibilityProvider(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            title: 'Notas',
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            routerConfig: routerConfig,
            builder: EasyLoading.init(
              builder: (context, child) {
                return ValueListenableBuilder(
                  valueListenable: LoadingController().isLoading,
                  builder: (context, value, _) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return LoadingWrapper(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          isLoading: value,
                          child: child,
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
