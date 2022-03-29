import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/home/widgets.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

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
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
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
              const TabBar(
                tabs: [
                  Tab(
                    // text: "Upcoming",
                    child: Text(
                      "Upcoming",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Tab(
                    // text: "Past",
                    child: Text(
                      "Past",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorColor: Colors.black54,
              ),
              // const Divider(
              //   color: Colors.black54,
              // ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('Bookings')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      List<Map<String, dynamic>> allList = [];
                      for (var element in snapshot.data.docs) {
                        allList.add(element.data());
                      }
                      List<Map<String, dynamic>> upcoming = allList
                              .where((element) => (element['time'] as Timestamp)
                                  .toDate()
                                  .isAfter(DateTime.now()))
                              .toList(),
                          past = allList
                              .where((element) => (element['time'] as Timestamp)
                                  .toDate()
                                  .isBefore(DateTime.now()))
                              .toList();
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TabBarView(
                          children: [
                            ValueListenableBuilder<String>(
                                valueListenable: searchStream,
                                builder: (context, text, _) {
                                  List<Map<String, dynamic>> _searched = text
                                          .isNotEmpty
                                      ? upcoming
                                          .where((element) =>
                                              (element['worker_name'].toString() +
                                                      (element['services']
                                                              as List)
                                                          .toString())
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(text.toLowerCase()))
                                          .toList()
                                      : upcoming;
                                  if (_searched.isEmpty) {
                                    return const Center(
                                        child: Text("No bookings found"));
                                  }
                                  return ListView.builder(
                                      itemCount: _searched.length,
                                      itemBuilder: (ctx, i) => HistoryWidget(
                                            obj: _searched[i],
                                          ));
                                }),
                            ValueListenableBuilder<String>(
                                valueListenable: searchStream,
                                builder: (context, text, _) {
                                  List<Map<String, dynamic>> _searched = text
                                          .isNotEmpty
                                      ? past
                                          .where((element) =>
                                              (element['worker_name'].toString() +
                                                      (element['services']
                                                              as List)
                                                          .toString())
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(text.toLowerCase()))
                                          .toList()
                                      : past;
                                  if (_searched.isEmpty) {
                                    return const Center(
                                        child: Text("No bookings found"));
                                  }
                                  return ListView.builder(
                                      itemCount: _searched.length,
                                      itemBuilder: (ctx, i) => HistoryWidget(
                                            obj: _searched[i],
                                          ));
                                  // GridView.builder(
                                  //     gridDelegate:
                                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                                  //             crossAxisCount: 2,childAspectRatio: 1.2),
                                  //     itemCount: _categories.length,
                                  //     itemBuilder: (ctx, i) => CategoryPageListItem(
                                  //           obj: _categories[i],
                                  //         ));
                                }),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
