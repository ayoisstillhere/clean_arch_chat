import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';

class MessageLayout extends StatelessWidget {
  final String uid;
  final String type;
  final text;
  final time;
  final color;
  final align;
  final boxAlignment;
  final nip;
  final senderName;
  final senderId;
  const MessageLayout({
    Key? key,
    required this.uid,
    required this.type,
    required this.text,
    required this.time,
    required this.color,
    required this.align,
    required this.boxAlignment,
    required this.nip,
    required this.senderName,
    required this.senderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: boxAlignment,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(3),
          child: Bubble(
            color: color,
            nip: nip,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                uid == senderId
                    ? Text(
                        "Me",
                        textAlign: align,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        senderName,
                        textAlign: align,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                Text(
                  text == "" ? "" : text,
                  textAlign: align,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  time,
                  textAlign: align,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
