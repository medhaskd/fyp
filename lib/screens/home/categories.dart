import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/home/widgets.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key key}) : super(key: key);

  final TextEditingController text = TextEditingController();

  final ValueNotifier<String> searchStream = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    text.addListener(
      () {
        searchStream.value = text.text;
      },
    );
    return Column(
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
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('Services').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                List<Map<String,dynamic>> categories = [];
                for (var element in snapshot.data.docs) {
                  categories.add(element.data());
                }
                return ValueListenableBuilder<String>(
                    valueListenable: searchStream,
                    builder: (context, text, _) {
                      List<Map<String, dynamic>> _categories = text.isNotEmpty
                          ? categories
                              .where((element) => element['name']
                                  .toString()
                                  .toLowerCase()
                                  .contains(text.toLowerCase()))
                              .toList()
                          : categories;
                      if (_categories.isEmpty) {
                        return const Center(child: Text("No categories found"));
                      }
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,childAspectRatio: 1.2),
                          itemCount: _categories.length,
                          itemBuilder: (ctx, i) => CategoryPageListItem(
                                obj: _categories[i],
                              ));
                    });
              }),
        ),
      ],
    );
  }
}
