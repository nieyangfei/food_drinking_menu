import 'package:flutter/material.dart';

/// Flutter code sample for [Scaffold].

/// Run the scaffold.
void main() => runApp(const ScaffoldExampleApp());

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[200], // light grey background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800], // dark grey app bar
          foregroundColor: Colors.white, // text color in app bar
        ),
      ),
      home: const ScaffoldExample(),
    );
  }
}

/// Scaffold class.
class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({super.key});

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

/// Scaffold class with state.
class _ScaffoldExampleState extends State<ScaffoldExample> {
  /* 和左上角抽屉相关的变量。 */
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        // Create a grid with 2 columns.
        // If you change the scrollDirection to horizontal,
        // this produces 2 rows.
        crossAxisCount: 4,
        // Generate 100 widgets that display their index in the list.
        children: getDrinkList(),

        // List.generate(100, (index) {
        //   return Center(
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min, // makes column fit its content
        //       children: [
        //         Image.asset('assets/images/vodka_matini.png'),
        //         Text('Vodka Martini'),
        //       ],
        //     ),
        //   );
        // }),
      ),

      appBar: AppBar(title: const Text('app bar 最上面的横着的杆子')),

      /* Drawer。 */
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header 左上角的抽屉'),
            ),
            ListTile(
              title: const Text('Home主页'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business业务'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School学校'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      onDrawerChanged: null,
    );
  }
}

getDrinkList() {
  // List of drink images (make sure these files exist in your assets)
  final List<String> imagePaths = [
    'assets/images/vodka_matini.png',
    'assets/images/long_island_iced_tea.png',
    'assets/images/mojito.png',
    'assets/images/cosmopolitan.png',
    'assets/images/sex_on_the_beach.png',
    'assets/images/caipirinha.png',
    'assets/images/manhattan.png',
    'assets/images/strawberry_daiquiri.png',
    'assets/images/mai_tai.png',
    'assets/images/b52.png',
    'assets/images/tom_collins.png',
    'assets/images/pina_coloda.png',
  ];

  // List of drink names
  final List<String> drinkNames = [
    'Vodka Martini',
    'LONG ISLAND ICED TEA',
    'MOJITO',
    'COSMOPOLITAN',
    'SEX ON THE BEACH',
    'CAIPIRINHA',
    'MANHATTAN',
    'STRAWBERRY DAIQUIRI',
    'MAI TAI',
    'B52',
    'TOM COLLINS',
    'PINACOLODA',
  ];

  return List.generate(12, (index) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // makes column fit its content
        children: [Image.asset(imagePaths[index]), Text(drinkNames[index])],
      ),
    );
  });
}
