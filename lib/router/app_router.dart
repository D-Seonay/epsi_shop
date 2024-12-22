import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../composant/navbar.dart';
import '../composant/product_list_screen.dart';
import '../page/cart_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: const Navbar(), // Navbar sur toutes les pages
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ProductListScreen(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),
      ],
    ),
  ],
);
