import 'package:flutter/material.dart';

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
              left: 11,
              // right: 153,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.network(
                  image,
                  fit: BoxFit.contain,
                )
              ],
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
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 18, right: 18, top: 18),
      padding: const EdgeInsets.only(left: 33, right: 8, top: 8),
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
      child: Row(
        children: [
          SizedBox(height: 120, width: 50, child: Image.asset(obj['image'])),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                obj['name'],
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                obj['subtitle'],
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xff595959),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
