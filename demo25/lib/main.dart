import 'package:demo25/src/core/animation/page_transition.dart';
import 'package:demo25/src/core/theme/app_theme.dart';
import 'package:demo25/src/onboarding/onboarding_screen.dart';
import 'package:demo25/src/recipes/domain/recipe.dart';
import 'package:demo25/src/recipes/presentation/screens/home_screen.dart';
import 'package:demo25/src/recipes/presentation/screens/recipe_details_screen.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      home: const OnBoardingScreen(),
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          'home' => NoAnimationTransition(
              builder: (context) => const HomeScreen(),
            ),
          'recipe_details' => NoAnimationTransition(
              builder: (context) =>
                  RecipeDetailsScreen(recipe: settings.arguments as Recipe),
            ),
          _ => NoAnimationTransition(builder: (context) => const HomeScreen())
        };
      },
      theme: mainTheme,
      darkTheme: mainTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
