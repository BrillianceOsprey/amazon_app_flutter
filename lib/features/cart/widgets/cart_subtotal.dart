import 'package:amazon_app_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartSubtotal extends HookConsumerWidget {
  const CartSubtotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = context.watch<UserProvider>().user;
    final user = ref.watch(userProvider);
    int sum = 0;
    user?.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text(
            'Subtotal ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '\$$sum',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
