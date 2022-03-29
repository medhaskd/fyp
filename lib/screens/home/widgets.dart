// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fyp/globals/designs/size_config.dart';
import 'package:fyp/globals/navigation/navigator_services.dart';
import 'package:fyp/screens/chat/chat_screen.dart';
import 'package:fyp/screens/home/home.dart';
import 'package:fyp/screens/worker/all_workers.dart';
import 'package:fyp/screens/worker/worker_detail.dart';
import 'package:intl/intl.dart';

class OfferListItem extends StatelessWidget {
  const OfferListItem({Key key, this.title, this.image}) : super(key: key);

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 7.65),
        Card(
          elevation: 20.0,
          shadowColor: Colors.black26,
          child: Container(
            height: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[50],
            ),
            padding: const EdgeInsets.only(
                // left: 11,
                // right: 153,
                ),
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(height: 7.65),
      ],
    );
  }
}

class RecomListItem extends StatelessWidget {
  final String title, subtitle, image;
  final int type;
  const RecomListItem(
      {Key key, this.title, this.subtitle, this.image, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 150,
      height: 200,
      child: Stack(
        children: [
          Container(
            // width: 124,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1976d2), Color(0xff0061a7)],
              ),
            ),
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: Color(0xfff1f1f1),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color(0x21ffffff),
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 5,
              child: Image.asset(
                image,
                height: 150,
                alignment: Alignment.bottomCenter,
              )),
        ],
      ),
    );
  }
}

class CategoryPageListItem extends StatelessWidget {
  const CategoryPageListItem({Key key, this.obj}) : super(key: key);

  final Map<String, dynamic> obj;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorService().navigate(
            context,
            AllWorkers(
              service: obj['name'],
            ));
      },
      child: Ink(
        child: Container(
          height: 180,
          width: SizeConfig.screenWidth / 2.3,
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0c000000),
                blurRadius: 14,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 116,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      obj['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Color(0x00000000)],
                  ),
                ),
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      obj['name'].toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Color(0xff595959),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.chevron_right_rounded),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceWorkerTile extends StatelessWidget {
  const ServiceWorkerTile({Key key, this.obj}) : super(key: key);
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
    return GestureDetector(
      onTap: () {
        NavigatorService().navigate(
            context,
            WorkerDetail(
              obj: obj,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xfff1f1f1),
            width: 1,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Color(0x0c000000),
              blurRadius: 14,
              spreadRadius: 5.0,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                            image: NetworkImage(obj['image']),
                            fit: BoxFit.cover),
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
                      obj['name'],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
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
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline)),
                  ),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 51,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Color(0xff003156),
              ),
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Send booking Request ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({this.obj, Key key}) : super(key: key);
  final Map<String, dynamic> obj;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _likeNotifier =
        ValueNotifier<bool>(obj['isLiked']);

    return Column(
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
                  image: NetworkImage(obj['image']), fit: BoxFit.cover),
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
            obj['name'],
            textAlign: TextAlign.justify,
            style: const TextStyle(
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
          trailing: ValueListenableBuilder<bool>(
              valueListenable: _likeNotifier,
              builder: (context, value, _) {
                return IconButton(
                    onPressed: () {
                      _likeNotifier.value = !value;
                    },
                    icon: Icon(
                      value
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: Colors.redAccent,
                    ));
              }),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          obj['comment'],
          style: const TextStyle(
            color: Color(0xff595959),
            fontSize: 14,
          ),
        )
      ],
    );
  }
}

class BookingModal extends StatelessWidget {
  const BookingModal({Key key, @required this.obj}) : super(key: key);

  final Map<String, dynamic> obj;

  @override
  Widget build(BuildContext context) {
    List<String> _allServices = [];
    for (var element in (obj['services'] as List)) {
      _allServices.add(element);
    }
    ValueNotifier<DateTime> _pickedTime =
        ValueNotifier<DateTime>(DateTime.now());
    ValueNotifier<List<String>> _pickedServices =
        ValueNotifier<List<String>>([]);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Pick date and time",
            style: TextStyle(
              color: Color(0xff595959),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ValueListenableBuilder<DateTime>(
                valueListenable: _pickedTime,
                builder: (context, value, _) {
                  return CupertinoDatePicker(
                      // initialDateTime: DateTime.now(),
                      minimumDate: DateTime.now(),
                      mode: CupertinoDatePickerMode.dateAndTime,
                      onDateTimeChanged: (val) {
                        _pickedTime.value = val;
                        _pickedTime.notifyListeners();
                      });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Pick a service",
            style: TextStyle(
              color: Color(0xff595959),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder<List<String>>(
              valueListenable: _pickedServices,
              builder: (context, value, _) {
                return Column(
                  children: List.generate(_allServices.length, (index) {
                    // print(value);
                    // print(value.contains(_allServices[index]));
                    return CheckboxListTile(
                        value:
                            _pickedServices.value.contains(_allServices[index]),
                        title: Text(
                          _allServices[index],
                          style: const TextStyle(
                            color: Color(0xff16191c),
                            fontSize: 16,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) {
                          if (v) {
                            List<String> _temp = _pickedServices.value;
                            _temp.add(_allServices[index]);
                            _pickedServices.value = _temp;
                            _pickedServices.notifyListeners();
                          } else {
                            List<String> _temp = _pickedServices.value;
                            _temp.remove(_allServices[index]);
                            _pickedServices.value = _temp;
                            _pickedServices.notifyListeners();
                          }
                        });
                  }),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (() async {
              if (_pickedServices.value.isEmpty) {
                NavigatorService().pop(context);
                NavigatorService().showSnackbar(
                    context, "Please select at least one service");
              } else {
                User _user = FirebaseAuth.instance.currentUser;

                await FirebaseFirestore.instance.collection('Bookings').add({
                  'time': Timestamp.fromDate(_pickedTime.value),
                  'worker_id': obj['worker_id'],
                  'worker_name': obj['name'],
                  'services': _pickedServices.value,
                  'owner_id': _user.uid,
                  'worker_image': obj['image']
                });
                NavigatorService()
                    .showSnackbar(context, "Successfully booked service!");
                NavigatorService().clearNavigate(context, const HomePage(initIndex: 3,));
              }
            }),
            child: Container(
              width: double.infinity,
              height: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff003156),
                  width: 1,
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                left: 144,
                right: 143,
                top: 14,
                bottom: 13,
              ),
              child: const Center(
                child: Text(
                  "Done",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xff003156),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key key, this.obj}) : super(key: key);

  final Map<String, dynamic> obj;

  @override
  Widget build(BuildContext context) {
    String _services = "";
    for (var element in obj['services']) {
      _services += (element.toString() + ", ");
    }
    _services = _services.substring(0, _services.length - 2);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xfff1f1f1),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 42,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            _services + " with " + obj['worker_name'],
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.event,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  DateFormat().format((obj['time'] as Timestamp).toDate()),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color(0xff595959),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              NavigatorService().navigate(
                  context,
                  ChatScreen(
                    workerId: obj['worker_id'],
                    workerImage: obj['worker_image'],
                    workerName: obj['worker_name'],
                  ));
            },
            child: Container(
              width: 120,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff003156),
              ),
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Send a message",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class AllChatListItem extends StatelessWidget {
  const AllChatListItem({Key key, this.obj}) : super(key: key);
  final Map<String, dynamic> obj;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        NavigatorService().navigate(
            context,
            ChatScreen(
              workerId: obj['worker_id'],
              workerImage: obj['worker_image'],
              workerName: obj['worker_name'],
            ));
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(obj['worker_image'])),
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
        obj['worker_name'],
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Row(
        children: [
          if (obj['chats'].last['sender'] == 'user')
            Icon(
              Icons.done_all_outlined,
              color: obj['unread'] == 0 ? Colors.blue : Colors.black45,
            ),
          Text(obj['chats'].last['text']),
        ],
      ),
      trailing: Text(DateFormat('hh:mm')
          .format((obj['chats'].last['created_at'] as Timestamp).toDate())),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key key, this.obj}) : super(key: key);
  final Map<String, dynamic> obj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: obj['sender'] == 'user'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Bubble(
            nip: obj['sender'] == 'user'
                ? BubbleNip.rightTop
                : BubbleNip.leftTop,
            color: obj['sender'] == 'user'
                ? const Color.fromRGBO(225, 255, 199, 1.0)
                : const Color.fromARGB(255, 15, 227, 255),
            child: Text(obj['text'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0)),
          ),
        ),
      ],
    );
  }
}
