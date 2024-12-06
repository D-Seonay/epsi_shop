import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../composant/product_list_screen.dart';
import '../page/cart_page.dart';
import '../page/detail_article_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductListScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final product = state.extra as Map<String, dynamic>;
        return ProductDetailScreen(product: product);
      },
    ),
  ],
);
