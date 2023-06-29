import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta/providers/user_provider.dart';
import 'package:insta/models/user.dart';
import 'package:insta/resources/firestore_methods.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/pick_image.dart';
import 'package:insta/widgets/comment_card.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({required this.snap, super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Comments'),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            .doc(widget.snap['postId'])
            .collection('comments')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: ((context, index) =>
                CommentCard(snap: snapshot.data!.docs[index])),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 18,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Comment as ${user.username}',
                  border: InputBorder.none,
                ),
              ),
            )),
            InkWell(
              onTap: (() async {
                await FirestoreMethods().postComments(
                    widget.snap['postId'],
                    _commentController.text,
                    user.uid,
                    user.username,
                    user.photoUrl);

                setState(() {
                  _commentController.text = "";
                });
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
