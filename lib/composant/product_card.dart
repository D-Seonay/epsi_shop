import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0, // Ajout d'une ombre pour rendre la carte plus visible
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du produit
          Image.network(
            product['image'],
            height: 400.0, // Augmenter la hauteur de l'image
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // Taille de la police augmentée
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${product['price']}',
                style: const TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(height: 8.0), // Espacement entre le prix et le bouton
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to Cart')),
                  );
                },
              ),
              // Bouton "Détails" qui redirige vers la page de détail
              TextButton(
                onPressed: onTap,
                child: const Text(
                  'Voir les détails',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
