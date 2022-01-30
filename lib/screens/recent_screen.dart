import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .snapshots(includeMetadataChanges: true),
            builder: (context, snapshot) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final doc = documents[index];
                  if (doc.id == FirebaseAuth.instance.currentUser!.uid) {
                    return ListTile(
                      title: Text(doc.id),
                      subtitle:
                          Text(doc.get("userorders")[0]["status"].toString()),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: documents.length,
              );
            },
          )
        ],
      ),
    );
  }
}
