import 'package:amazon_app_flutter/constants/global_variables.dart';
import 'package:amazon_app_flutter/features/account/services/account_services.dart';
import 'package:amazon_app_flutter/features/account/widgets/single_product.dart';
import 'package:amazon_app_flutter/features/order_details/screens/order_details.dart';
import 'package:amazon_app_flutter/models/order.dart';
import 'package:amazon_app_flutter/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Orders extends StatefulHookConsumerWidget {
  const Orders({super.key});

  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends ConsumerState<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    // orders = await accountServices.fetchMyOrders(context: context, ref: ref);
    orders = await ref
        .read(accountServicesProvider)
        .fetchMyOrders(context: context, ref: ref);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailScreen.routeName,
                          arguments: orders![index],
                        );
                      },
                      child: SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
