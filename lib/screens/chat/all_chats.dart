import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/widgets.dart';

class AllChats extends StatelessWidget {
  AllChats({Key key, this.service = ""}) : super(key: key);

  final String service;

  final TextEditingController text = TextEditingController();

  final ValueNotifier<String> searchStream = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    text.addListener(
      () {
        searchStream.value = text.text;
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: text,
                validator: (s) {
                  if (s.isEmpty) {
                    return "* Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Search',
                  hintText: 'Enter search text',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
                cursorColor: Colors.purple,
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('Chats')
                    .where('user_id',
                        isEqualTo: FirebaseAuth.instance.currentUser.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator());
                  }
                  List<Map<String, dynamic>> categories = [];
                  for (var element in snapshot.data.docs) {
                    categories
                        .add(element.data());
                  }
                  return Expanded(
                    child: ValueListenableBuilder<String>(
                        valueListenable: searchStream,
                        builder: (context, text, _) {
                          List<Map<String, dynamic>> _categories =
                              text.isNotEmpty
                                  ? categories
                                      .where((element) => element['worker_name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(text.toLowerCase()))
                                      .toList()
                                  : categories;
                          if (_categories.isEmpty) {
                            return const Center(
                                child: Text("No chats found"));
                          }
                          return ListView.builder(
                            padding: const EdgeInsets.all(12.0),
                              itemCount: _categories.length,
                              itemBuilder: (ctx, i) => AllChatListItem(
                                    obj: _categories[i],
                                  ));
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
