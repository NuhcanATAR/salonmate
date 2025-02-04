import 'package:flutter/material.dart';
import 'package:salonmate/feature/favorite/favorite_viewmodel.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends FavoriteViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite View"),
      ),
    );
  }
}
