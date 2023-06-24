import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset(
          'assets/insta_logo.png',
          height: 38,
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline))
        ],
      ),
      body: const PostCard(),
    );
  }
}
