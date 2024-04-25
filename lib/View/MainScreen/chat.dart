import 'package:finialproject/View/MainScreen/chatwidget.dart';
import 'package:finialproject/View/MainScreen/message.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final String email;

  ChatScreen({Key? key, required this.email}) : super(key: key);

  static const String id = 'ChatPage';

  final ScrollController _scrollController = ScrollController();
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Messages> messagesList = snapshot.data!.docs
              .map((doc) =>
                  Messages.fromJsonMap(doc.data() as Map<String, dynamic>))
              .toList();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: secondColor,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/2.jpg'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      final message = messagesList[index];
                      final isCurrentUser = message.id == email;

                      return isCurrentUser
                          ? ChatWidgetSend(message: message)
                          : ChatWidgetRecieve(message: message);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF8092F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Color(0xFF8092F4)),
                            ),
                            hintText: 'Send Message',
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final message = _controller.text;
                          if (message.isNotEmpty && email != null) {
                            sendMessage(message, email);
                            _controller.clear();
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          } else {
                            print(
                                "email null !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
                          }
                        },
                        icon: Icon(Icons.send, color: Color(0xFF8092F4)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(body: Center(child: Text('Loading...')));
        }
      },
    );
  }

  Future<void> sendMessage(String message, String? email) async {
    if (email != null) {
      await messages.add({
        'content': message,
        'createdAt': DateTime.now(),
        'id': email,
      });
    } else {
      // Handle the case where email is null
      print('Email is null, cannot send message.');
    }
  }
}
