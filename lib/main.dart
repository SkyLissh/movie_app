import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:provider/provider.dart";
import "package:bitsdojo_window/bitsdojo_window.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/providers/providers.dart";
import "package:movie_app/screens/screens.dart";
import "package:movie_app/widgets/widgets.dart";

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AppState());

  if (kIsDesktop) {
    doWhenWindowReady(() {
      appWindow.size = const Size(1280, 720 + 1);
      appWindow.size = const Size(1280, 720);

      appWindow.minSize = const Size(800, 600);

      appWindow.alignment = Alignment.center;
      appWindow.title = "Movie App";

      appWindow.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      // builder: (context, child) => TopBar(child: child!),
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 40),
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color.fromARGB(255, 135, 135, 179),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.normal,
          ),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => const Home(),
        "details": (context) => const Details(),
        "search": (context) => const Search(),
      },
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}
