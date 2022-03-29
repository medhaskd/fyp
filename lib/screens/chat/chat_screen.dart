import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/widgets.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key key, this.workerName = "", this.workerImage, this.workerId})
      : super(key: key);

  final String workerName, workerImage, workerId;

  final TextEditingController chatText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String docId = "";
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(workerImage)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 9,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    workerName,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: const [
                      Text(
                        "Online",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xff00c17b),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  trailing: const Icon(
                    Icons.call_outlined,
                    color: Colors.black45,
                  )),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('Chats')
                    .where('user_id',
                        isEqualTo: FirebaseAuth.instance.currentUser.uid)
                    .where('worker_id', isEqualTo: workerId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator());
                  }
                  if (snapshot.data.docs.isEmpty) {
                    return const Expanded(
                        child: Center(child: Text("No messages yet")));
                  } else {
                    docId = snapshot.data.docs.first.id;
                  }
                  List<Map<String, dynamic>> chats = [];
                  for (var element in snapshot.data.docs[0].data()['chats']) {
                    chats.add(element);
                  }
                  return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: chats.length,
                        itemBuilder: (ctx, i) => ChatBubble(
                              obj: chats[i],
                            )),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: chatText,
                      validator: (s) {
                        if (s.isEmpty) {
                          return "* Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        hintText: 'Enter message',
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
                  IconButton(
                      onPressed: () async {
                        if (chatText.text.isNotEmpty) {
                          if (docId.isNotEmpty) {
                            FirebaseFirestore.instance
                                .collection('Chats')
                                .doc(docId)
                                .update({
                              'chats': FieldValue.arrayUnion([
                                {
                                  'created_at': Timestamp.now(),
                                  'sender': 'user',
                                  'text': chatText.text,
                                }
                              ]),
                            });
                          } else {
                            var c = await FirebaseFirestore.instance
                                .collection('Chats')
                                .add({
                              'unread': 0,
                              'worker_id': workerId,
                              'worker_name': workerName,
                              'worker_image': workerImage,
                              'user_id': FirebaseAuth.instance.currentUser.uid,
                              'user_name': "Medha",
                              'chats': [
                                {
                                  'created_at': Timestamp.now(),
                                  'sender': 'user',
                                  'text': chatText.text,
                                }
                              ],
                            });
                            docId = c.id;
                          }
                          chatText.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.black45,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
