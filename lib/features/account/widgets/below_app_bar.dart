import 'package:amazon_app_flutter/constants/global_variables.dart';
import 'package:amazon_app_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BelowAppBar extends HookConsumerWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = Provider.of<UserProvider>(context).user;
    final user = ref.watch(userProvider);

    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: user?.name ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
