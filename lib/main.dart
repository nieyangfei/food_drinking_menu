import 'package:flutter/material.dart';

/// Flutter code sample for [Scaffold].

/// Run the scaffold.
final Color greyColor = Colors.grey[800]!;

void main() => runApp(const ScaffoldExampleApp());

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: greyColor, // light grey background
        appBarTheme: AppBarTheme(
          backgroundColor: greyColor, // dark grey app bar
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
        // Create a grid with 4 columns.
        crossAxisCount: 4,
        // Generate 12 drinks that display their index in the list.
        children: getDrinkList(),
      ),

      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
      ),

      /* Drawer。 */
      drawer: Drawer(
        backgroundColor: greyColor, // Make the drawer background grey
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: greyColor),
              child: const Text(
                'Customer informations',
                style: TextStyle(color: Colors.white, fontSize: 20), // Header text white
              ),
            ),
            ListTile(
              title: const Text(
                'Orders',
                style: TextStyle(color: Colors.white), // Text white
              ),
              selected: _selectedIndex == 0,
              selectedTileColor: Colors.grey[700], // Optional: highlight selected item
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Private information',
                style: TextStyle(color: Colors.white), // Text white
              ),
              selected: _selectedIndex == 1,
              selectedTileColor: Colors.grey[700], // Optional: highlight selected item
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white), // Text white
              ),
              selected: _selectedIndex == 2,
              selectedTileColor: Colors.grey[700], // Optional: highlight selected item
              onTap: () {
                _onItemTapped(2);
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
        children: [
          Image.asset(imagePaths[index]),
          Text(
            drinkNames[index],
            style: const TextStyle(color: Colors.white), // Make grid text white
          ),
        ],
      ),
    );
  });
}
