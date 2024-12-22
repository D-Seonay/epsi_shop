import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../page/detail_article_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  String formatPrice(double price) {
    // return '${price.toStringAsFixed(2)} €'; // Format simple
    // OU avec intl pour un format localisé :
    return NumberFormat.currency(locale: 'fr_FR', symbol: '€').format(price);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre panier'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text('Votre panier est vide'))
          : Column(
                children: [
                Expanded(
                  child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.cartItems[index];
                    return ListTile(
                    leading: Image.network(item.product['image'] as String, width: 50),
                    title: GestureDetector(
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: item.product,
                        ),
                        ),
                      );
                      },
                      child: Text(
                      item.product['title'] as String,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      ),
                    ),
                    subtitle: Text(
                      '${item.quantity} x ${formatPrice(item.product['price'] as double)}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                      cartProvider.removeFromCart(item.product);
                      },
                    ),
                    );
                  },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                  children: [
                    Text(
                    'Total: ${formatPrice(cartProvider.totalPrice)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Vider le panier')),
                        );
                        cartProvider.clearCart();
                      },
                      child: const Text('Vider le panier'),
                      ),
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        cartProvider.clearCart();
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                          title: const Text('Merci !!!'),
                          content: const Text('Votre commande a été passée avec succès.'),
                          actions: <Widget>[
                            TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                            ),
                          ],
                          );
                        },
                        );
                      },
                      child: const Text('Acheter'),
                      ),
                    ],
                    ),
                  ],
                  ),
                ),
              ],
            ),
    );
  }
}
