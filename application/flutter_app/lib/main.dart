import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/lectures.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x1B72C0))),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xA2C9FF), brightness: Brightness.dark)),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key, required this.title});
  final String title;

  @override
  State<MainScaffold> createState() => MainScaffoldState();
}

class AppRoute {
  static const String home = "Home";
  static const String lectures = "Lectures";
  static const String settings = "Settings";
}



class MainScaffoldState extends State<MainScaffold> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          title: Text(
            widget.title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
        ),
        bottomNavigationBar: NavigationBar(
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(0.08),
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  _navigatorKey.currentState?.pushNamed(AppRoute.home);
                  break;
                case 1:
                  _navigatorKey.currentState?.pushNamed(AppRoute.lectures);
                  break;
                case 2:
                  _navigatorKey.currentState?.pushNamed(AppRoute.settings);
                  break;
              }
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: <Widget>[
              NavigationDestination(
                  icon: Image.asset("lib/icons/home.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  selectedIcon: Image.asset("lib/icons/home_filled.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: "Home"),
              NavigationDestination(
                  icon: Image.asset("lib/icons/lectures.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  selectedIcon: Image.asset("lib/icons/lectures_filled.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: "Lectures"),
              NavigationDestination(
                  icon: Image.asset("lib/icons/settings.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  selectedIcon: Image.asset("lib/icons/settings_filled.png",
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: "Settings")
            ]),
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute));
  }

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoute.lectures:
        return mainPageRouteBuilder(const Lectures());
      case AppRoute.settings:
        return mainPageRouteBuilder(const Settings());
      default:
        return mainPageRouteBuilder(const Home());
    }
  }

  PageRouteBuilder mainPageRouteBuilder(Widget child) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 100),
        reverseTransitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        });
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
          FilledButton(onPressed: onPressed, child: const Text("Filled")),
          FilledButton.tonal(
              onPressed: onPressed, child: const Text("Filled Tonal")),
          OutlinedButton(
              onPressed: onPressed, child: const Text("Outlined Button")),
          TextButton(onPressed: onPressed, child: const Text("Text"))
        ]);
  }
}
