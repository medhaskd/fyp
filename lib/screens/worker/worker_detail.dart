import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fyp/screens/home/widgets.dart';

class WorkerDetail extends StatelessWidget {
  const WorkerDetail({Key key, this.obj}) : super(key: key);

  final String img =
      "https://firebasestorage.googleapis.com/v0/b/final-year-project-f92fd.appspot.com/o/Services%2Fimage%201.png?alt=media&token=ead6a1b6-54bf-444e-85be-e33feda3d2db";

  final Map<String, dynamic> obj;
  @override
  Widget build(BuildContext context) {
    String location = "", services = "";
    for (var element in (obj['services'] as List)) {
      services += (element.toString() + ", ");
    }
    for (var element in (obj['location'] as List)) {
      location += (element.toString() + ", ");
    }
    services = services.substring(0, services.length - 2);
    location = location.substring(0, location.length - 2);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Color(0x00000000)],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(obj['image'])),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 9,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          title: const Text(
                            "Jane Cooper",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              RatingBar.builder(
                                initialRating: obj['rating'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                unratedColor: Colors.white,
                                itemSize: 20,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.only(right: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: null,
                              ),
                              Text("${obj['rating']} / 5"),
                            ],
                          ),
                          trailing: Text(
                            obj['isOpen'] ? "Open now" : "BUSY",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Color(0xff00c17c),
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(height: 20),
                      const Text(
                        "Services",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xffc4c4c4),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        services,
                        style: const TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Location",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xffc4c4c4),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleButton(icon: Icons.share_outlined),
                            CircleButton(icon: Icons.chat_bubble_outline),
                            CircleButton(icon: Icons.call_outlined),
                            CircleButton(icon: Icons.pin_drop_outlined),
                          ]),
                      const SizedBox(height: 20),
                      const Text(
                        "Reviews",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xffc4c4c4),
                          fontSize: 14,
                        ),
                      ),
                    ] +
                    List.generate(
                      2,
                      (index) => ReviewWidget(
                        obj: {
                          'name': "Peter Dexter",
                          'image': img,
                          'rating': 4.0,
                          'comment':
                              "Such sweet lady keeps the kids happy and is extre-emly carefull",
                          'isLiked': true,
                        },
                      ),
                    ) +
                    [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              // constraints: BoxConstraints(
                              //     minHeight: SizeConfig.screenHeight / 2,
                              //     maxHeight: SizeConfig.screenHeight / 1.3),

                              // .loose(Size(
                              //     SizeConfig.screenWidth,
                              //     SizeConfig.screenHeight / 1.5)),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                              context: context,
                              isScrollControlled: true,
                              builder: (ctx) {
                                return Wrap(
                                  children: [
                                    BookingModal(
                                      obj: obj,
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Ink(
                          child: Container(
                            width: double.infinity,
                            height: 51,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff003156),
                            ),
                            child: const Center(
                              child: Text(
                                "Send booking Request ",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({Key key, this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: Colors.black45,
      ),
    );
  }
}
