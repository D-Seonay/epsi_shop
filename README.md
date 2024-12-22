# Faux Shop Flutter

Bienvenue dans **Faux Shop Flutter**, un projet de boutique fictive réalisé dans le cadre d'un cours pour découvrir les bases de Flutter et GoRouter.

Ce projet utilise une API publique pour afficher une liste de produits, leur détail, et gérer un panier.

---

## **Fonctionnalités**

1. **Page principale :**
   - Affiche une liste de produits récupérés depuis l'API `https://fakestoreapi.com/products`.
   - Chaque produit contient une image, un titre, et un prix.

2. **Page détail :**
   - Affiche des informations détaillées sur un produit, telles que la description et le prix.

3. **Panier :**
   - Possibilité d'ajouter des produits au panier depuis la liste ou la page détail.
   - Affiche les produits ajoutés et leur quantité totale.

---

## **Prérequis**

- [Flutter](https://flutter.dev/) (version 3.10 ou ultérieure recommandée)
- Un éditeur de texte tel que [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio).
- Accès à internet pour récupérer les données depuis l'API.

---

## **Installation**

1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/D-Seonay/epsi_shop.git
   ```

2. Accédez au dossier du projet :
   ```bash
   cd faux-shop-flutter
   ```

3. Installez les dépendances Flutter :
   ```bash
   flutter pub get
   ```

4. Lancez l'application :
   ```bash
   flutter run
   ```

---

## **Structure du Projet**

```
lib/
├── composant/
│   ├── navbar.dart          # Barre de navigation avec accès au panier
│   ├── product_card.dart    # Carte affichant un produit
│   ├── product_list.dart    # Liste des produits (page principale)
├── page/
│   ├── cart_page.dart       # Page du panier
│   ├── detail_article_page.dart # Page détaillée d'un produit
├── providers/
│   ├── cart_provider.dart   # Gestionnaire d'état pour le panier
├── router/
│   ├── app_router.dart      # Configuration des routes avec GoRouter
├── main.dart                # Point d'entrée de l'application
```

---

## **Technologies Utilisées**

- **Flutter** : Framework principal pour le développement mobile.
- **Provider** : Gestionnaire d'état pour le panier.
- **GoRouter** : Gestion des routes et de la navigation.
- **FakeStore API** : Source des données produits.

---

## **Exemple de Fonctionnalités Clés**

### **Ajout au panier**
Utilise `Provider` pour gérer les éléments ajoutés au panier et afficher dynamiquement le nombre d'articles dans la barre de navigation.

### **Navigation**
`GoRouter` simplifie les redirections entre :
- La page principale `/`
- Le panier `/cart`

---


## **Auteurs**

- **[D-Seonay | Mathéo DELAUNAY]** - Étudiant en développement logiciel.
