import '../../Model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/View/ChatScreen/ChatAligment.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';

class Messanger extends StatelessWidget {
  final messageController = TextEditingController();
  String reciverID = "";
  Messanger({required this.reciverID, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DataCubit>(context)
      ..getMessages(receiverID: reciverID);
    print('${reciverID}+555566666');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Neno',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          //automaticallyImplyLeading: false,
          backgroundColor: secondColor,
        ),
        body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {
            if (state is SendMessageSuccessState) {
              messageController.clear();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Expanded(
                      child: state is GetMessagesLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: cubit.messages.length,
                              itemBuilder: (context, index) {
                                return //reciverID ==
                                    //FirebaseAuth.instance.currentUser!.uid
                                    reciverID == "true"
                                        ? Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              padding: EdgeInsets.only(
                                                  left: 12,
                                                  bottom: 15,
                                                  top: 15,
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[900],
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end, // Align items to the start

                                                children: [
                                                  Text(
                                                    cubit.messages[index]
                                                        .content!,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(height: 7),
                                                  // Text(
                                                  //   '${DateFormat('hh:mm a').format(message.createdAt)}', // Format the time
                                                  //   style: const TextStyle(color: Colors.white70),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 15,
                                                  top: 15,
                                                  right: 12),
                                              decoration: BoxDecoration(
                                                color: secondColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start, // Align items to the start

                                                children: [
                                                  Text(
                                                    cubit.messages[index]
                                                        .content!,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(height: 7),
                                                  // Text(
                                                  //   '${DateFormat('hh:mm a').format(message.createdAt)}', // Format the time
                                                  //   style: const TextStyle(color: Colors.black26),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          );
                              })),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.send,
                            color: secondColor,
                          ),
                          onTap: () {
                            // Send Message to Firestore
                            cubit.sendMessage(
                                message: messageController.text,
                                receiverID: reciverID);
                          },
                        ),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            );
          },
        ));
  }
}
