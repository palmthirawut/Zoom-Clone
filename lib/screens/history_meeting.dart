import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore.dart';

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                title: Text(
                  'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                ),
                subtitle: Text(
                  'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
