import 'package:flutter/material.dart';
import 'package:helo_app/constants/theme.dart';
import 'package:helo_app/pages/login.dart';
import 'pages/todo.dart';
import 'models/page_card_models.dart';
import "pages/hava_durumu.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleThemeMode(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My great Flutter App',
      theme: AppTheme.lightThemeData(context),
      darkTheme: AppTheme.darkThemeData(),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Home Page',
        onThemeChange: _toggleThemeMode,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onThemeChange,
    required this.isDark,
  });

  final String title;
  final void Function(bool) onThemeChange;
  final bool isDark;

  static final List<Pages> pages = [
    Pages(name: "Todo Page", func: () => TodoPage(title: 'Todo Page')),
    Pages(name: "Login Page", func: () => LoginPage(title: 'Login Page')),
    Pages(name: "Weather Page", func: () => WeatherUI(title: 'Weather Page')),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildHomeTab(context),
                _buildSettingsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return ListView.builder(
      itemCount: MyHomePage.pages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage.pages[index].func(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_forward),
                  const SizedBox(width: 8),
                  Text(
                    MyHomePage.pages[index].name ?? 'No Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dark Mode"),
        Switch(
          value: widget.isDark,
          onChanged: widget.onThemeChange,
        ),
      ],
    );
  }
}
