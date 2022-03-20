import 'package:flutter/material.dart';
import 'package:fyp/screens/home/home.dart';
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
          child: ValueListenableBuilder<String>(
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
                return ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (ctx, i) => CategoryPageListItem(
                          obj: _categories[i],
                        ));
              }),
        ),
      ],
    );
  }
}
