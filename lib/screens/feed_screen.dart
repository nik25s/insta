import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('post').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) =>
                  PostCard(snap: snapshot.data!.docs[index].data()),
            );
          },
        ));
  }
}
