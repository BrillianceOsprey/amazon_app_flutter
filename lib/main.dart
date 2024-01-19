import 'package:amazon_app_flutter/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider(
  //     create: (context) => UserProvider(),
  //   ),
  // ], child: const MyApp()));
  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
