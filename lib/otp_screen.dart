import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, SizingInformation) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _topChat(),
                  _bodyChat(),
                ],
              ),
              _formChat(),
            ],
          ),
        ),
      ));
    });
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _itemChat(
                chat: 0,
                message:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '18.00',
                color: Color(0xff1EBE71),
                send: false),
            _itemChat(
                chat: 1,
                message: 'Okey 🐣',
                time: '18.00',
                color: Colors.grey.shade500,
                send: true),
            _itemChat(
                chat: 0,
                message: 'It has survived not only five centuries, 😀',
                time: '18.00',
                color: Color(0xff1EBE71),
                send: false),
            _itemChat(
                chat: 1,
                message:
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
                time: '18.00',
                color: Colors.grey.shade500,
                send: true),
            _itemChat(
                chat: 0,
                message:
                    'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                time: '18.00',
                color: Color(0xff1EBE71),
                send: false),
            _itemChat(
                chat: 1,
                message: '😅 😂 🤣',
                time: '18.00',
                color: Colors.grey.shade500,
                send: true),
            _itemChat(
                chat: 0,
                message:
                    'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                time: '18.00',
                color: Color(0xff1EBE71),
                send: false),
            _itemChat(
                chat: 1,
                message: '😅 😂 🤣',
                time: '18.00',
                color: Colors.grey.shade500,
                send: true),
          ],
        ),
      ),
    );
  }

  _itemChat({int? chat, message, time, Color? color, bool? send}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // chat == 1
        //     ? Center(
        //         child: Text(
        //           '$time',
        //           style: TextStyle(color: Colors.grey.shade400),
        //         ),
        //       )
        //     : const SizedBox(),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: chat == 0
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(30),
            ),
            child: BubbleSpecialThree(
              text: '$message',
              tail: true,
              color: color!,
              isSender: send!,
            ),
          ),
        ),
      ],
    );
  }

  Widget _formChat() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          color: const Color.fromARGB(255, 37, 37, 37),
          child: ListTile(
            leading: const Icon(
              Icons.add,
              size: 40,
              color: Colors.blue,
            ),
            title: Container(
              width: width * 0.2,
              child: TextFormField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: const TextStyle(
                    fontFamily: 'Lexend Deca ',
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                  filled: true,
                  suffixIcon: SvgPicture.asset(
                    "assets/images/Emoji.svg",
                    fit: BoxFit.scaleDown,
                    color: Colors.blue,
                  ),
                  fillColor: Colors.grey.shade500,
                  labelStyle: const TextStyle(fontSize: 12),
                  contentPadding: const EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            trailing: Wrap(
              spacing: 5,
              children: const [
                Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  size: 35,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.mic_none_outlined,
                  size: 35,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _topChat() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 37, 37, 37),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/8.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Pratham',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Last seen today at 12:30 PM',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.videocam_outlined,
                size: 40,
                color: Colors.blue,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.call_outlined,
                size: 30,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
