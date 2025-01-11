import 'package:flutter/material.dart';
import 'package:helo_app/constants/theme.dart';
import 'package:helo_app/pages/login.dart';
import 'pages/todo.dart';
import 'models/page_card_models.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My great Flutter App',
      theme: AppTheme.lightThemeData(context),
      darkTheme: AppTheme.darkThemeData(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(
          title: 'Home Page'), // Home sayfasını burada ayarlıyoruz
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  static final List<Pages> pages = [
    Pages(name: "Todo Page", func: () => TodoPage(title: 'Todo Page')),
    Pages(name: "Login Page", func: () => LoginPage(title: 'Login Page')),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                "All of these are fucking amazing pages I have written",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
              Column(
                children: List.generate(
                  MyHomePage.pages.length,
                  (index) => ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyHomePage.pages[index].func()),
                                );
                              },
                              child: Text(
                                MyHomePage.pages[index].name ?? 'No Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
