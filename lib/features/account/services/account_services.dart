// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:amazon_app_flutter/constants/error_handling.dart';
import 'package:amazon_app_flutter/constants/global_variables.dart';
import 'package:amazon_app_flutter/constants/utils.dart';
import 'package:amazon_app_flutter/features/auth/screens/auth_screen.dart';
import 'package:amazon_app_flutter/models/order.dart';
import 'package:amazon_app_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'account_services.g.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders(
      {required BuildContext context, required WidgetRef ref}) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = ref.watch(userProvider);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': user!.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

@riverpod
AccountServices accountServices(AccountServicesRef ref) {
  return AccountServices();
}
