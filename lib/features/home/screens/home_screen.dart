import 'package:flutter/material.dart';
import 'package:sociogram/features/home/data/users.dart';

import '../../../utils/back_ground.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/post_card.dart';
import '../widgets/stories_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/11.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Text(
                  'Hi ! Shaik \nAbdul\nKhuddus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Accounts'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.create_outlined),
                title: const Text('Create Reel'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.subscriptions_rounded),
                title: const Text('Followers'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle the navigation to Settings here
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text("Stories"),
                    const SizedBox(
                      height: 110,
                      child: Stories(),
                    ),
                    const SizedBox(height: 20),
                    const Text("Trending Posts"),
                    ...posts.map(
                          (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: PostCard(
                          m: e,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
