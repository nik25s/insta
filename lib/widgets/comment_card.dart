import 'package:flutter/material.dart';
import 'package:insta/models/user.dart';
import 'package:insta/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({required this.snap, super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.snap.data()['profilePic']),
          radius: 18,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.snap.data()['username'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' ${widget.snap.data()['text']}',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format((widget.snap.data()['datePublished'].toDate())),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.favorite, size: 16),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
