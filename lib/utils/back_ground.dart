import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociogram/utils/theme/theme_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MaterialApp(
        home: BackGround(child: NewPage()),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      appBar: AppBar(
        title: Text('New Page'),
        backgroundColor: Colors.orange.shade900,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.black,
            child: Center(
              child: Text(
                'Video Playing Section',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'This is the new page!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorite Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class BackGround extends StatefulWidget {
  const BackGround({super.key, required this.child});

  final Widget child;

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    SearchPage(),
    AddPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                    ...Provider.of<ThemeProvider>(context).themeMode
                        ? [
                      Colors.orange.withOpacity(.4),
                      Colors.blue.withOpacity(.4),
                    ]
                        : [
                      Colors.orange.shade100,
                      Colors.blue.shade100,
                    ]
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 80,
            left: 0,
            right: 0,
            child: _selectedIndex == 0
                ? widget.child
                : _pages[_selectedIndex - 1],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _onItemTapped(0),
                        icon: Icon(
                          Icons.home_rounded,
                          color: _selectedIndex == 0 ? Colors.orange.shade700 : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onItemTapped(1),
                        icon: Icon(
                          CupertinoIcons.search,
                          color: _selectedIndex == 1 ? Colors.orange.shade700 : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onItemTapped(2),
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: _selectedIndex == 2 ? Colors.orange.shade700 : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onItemTapped(3),
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: _selectedIndex == 3 ? Colors.orange.shade700 : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onItemTapped(4),
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Image.asset(
                            'assets/0_me.jpeg',
                            fit: BoxFit.cover,
                            height: 40,
                            color: _selectedIndex == 4 ? Colors.orange.shade700 : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
