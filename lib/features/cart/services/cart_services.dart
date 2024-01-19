// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_app_flutter/constants/error_handling.dart';
import 'package:amazon_app_flutter/constants/global_variables.dart';
import 'package:amazon_app_flutter/constants/utils.dart';
import 'package:amazon_app_flutter/models/product.dart';
import 'package:amazon_app_flutter/models/user.dart';
import 'package:amazon_app_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
    required WidgetRef ref,
  }) async {
    final userData = ref.watch(userProvider);
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userData?.token ?? '',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userData!.copyWith(cart: jsonDecode(res.body)['cart']);
          // userProvider.setUserFromModel(user);
          ref.read(userProvider.notifier).update((state) => user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
