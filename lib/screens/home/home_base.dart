import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/auth/splash.dart';
import 'package:fyp/screens/home/widgets.dart';

class HomeBase extends StatelessWidget {
  const HomeBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 46,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/ellipse.png'),
                  ),
                  const SizedBox(width: 16.0),
                  const Text(
                    "Hello Medha",
                    style: TextStyle(
                      color: Color(0xff595959),
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => const SplashScreen()));
                      },
                      icon: const Icon(Icons.logout_rounded)),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 40,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xfff1f1f1),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Search",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/search.png'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recommended for you",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xff595959),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('Services')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  List<Map<String, dynamic>> categories = [];
                  for (var element in snapshot.data.docs) {
                    categories.add(element.data());
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          categories.length,
                          (index) => CategoryPageListItem(
                                obj: categories[index],
                              )),
                    ),
                  );
                }),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "New Offers",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xff595959),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 19,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    FirebaseFirestore.instance.collection('Offers').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> dataDocs =
                      snapshot.data.docs;
                  return Column(
                    children: List.generate(
                        dataDocs.length,
                        (index) => OfferListItem(
                              title: dataDocs[index].data()['title'],
                              image: dataDocs[index].data()['image'],
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
