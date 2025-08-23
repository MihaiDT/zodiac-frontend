import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Ultra simple router for debugging
class UltraSimpleRouter {
  static GoRouter createRouter() {
    debugPrint('🚀 Creating UltraSimpleRouter...');
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            debugPrint('🏠 Building Home Page');
            return HomePage();
          },
        ),
        GoRoute(
          path: '/second',
          builder: (context, state) {
            debugPrint('🎯 Building Second Page');
            return SecondPage();
          },
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    debugPrint('🏠 HomePage initState');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomePage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Home Page', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('🚀 Home button pressed - navigating to /second');
                context.go('/second');
              },
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('🎯 SecondPage initState');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🎯 SecondPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Second Page'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SUCCESS! 🎉',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text('Navigation worked!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('🔙 Second page button pressed - navigating to /');
                context.go('/');
              },
              child: Text('Go Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
