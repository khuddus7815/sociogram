import 'package:flutter/material.dart';
import '../data/users.dart'; // Assuming this imports your user data

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          },
          child: StoryBackground(
            bottomText: "Your Story",
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade400,
                image: const DecorationImage(
                  image: AssetImage('assets/0_me.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black12,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        ...stories.map(
              (u) => StoryBackground(
            bottomText: u.userName,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                u.assetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ).toList(),
      ],
    );
  }
}

class StoryBackground extends StatelessWidget {
  const StoryBackground({
    Key? key,
    required this.child,
    required this.bottomText,
  }) : super(key: key);

  final Widget child;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(6),
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepOrange.shade300,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
        Text(
          bottomText,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Center(
        child: const Text('Camera Screen'),
      ),
    );
  }
}
