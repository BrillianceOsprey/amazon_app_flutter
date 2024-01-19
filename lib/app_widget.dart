import 'package:amazon_app_flutter/constants/global_variables.dart';
import 'package:amazon_app_flutter/features/admin/screens/admin_screen.dart';
import 'package:amazon_app_flutter/features/auth/screens/auth_screen.dart';
import 'package:amazon_app_flutter/features/auth/services/auth_service.dart';
import 'package:amazon_app_flutter/providers/user_provider.dart';
import 'package:amazon_app_flutter/router.dart';
import 'package:amazon_app_flutter/widgets/bottom_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppWidget extends StatefulHookConsumerWidget {
  const AppWidget({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<AppWidget> {
  // final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    // authService.getUserData(context);
    ref.read(authServiceProvider).getUserData(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    ref.listen(userProvider, (previous, next) {
      if (next?.token == null) {}
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: user?.token != null
          ? user?.type == 'user'
              ? const BottomBarPage()
              : const AdminScreen()
          : const AuthScreen(),
      // home: const BottomBar(),
    );
  }
}
