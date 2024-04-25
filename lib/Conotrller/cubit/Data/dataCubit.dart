import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finialproject/Model/message.dart';
import 'package:finialproject/Model/workers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finialproject/Model/userModel.dart';
import 'package:finialproject/constant/network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finialproject/Model/productModel.dart';
import 'package:finialproject/Model/catgoriesModel.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/Conotrller/cubit/Auth/cubitState.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(Datainital());
  static DataCubit getCubit(BuildContext context) => BlocProvider.of(context);
  String? selectedValue;

  String? title;
  String? des;
  String? price;
  String? place;
  String? title1;
  String? des1;
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  String? price1;
  String? place1;
  var uuid = Uuid();
  List<CatgoriesModel> catgories = [];
  List<WorkersModel> workers = [];
  UserDataModel? userData;
  List<ProductModel> products = [];
  List<ProductModel> faviorteList = [];

  Future<void> getCatgories() async {
    catgories.clear();
    emit(GetCatgoriesLoading());
    try {
      await FirebaseFirestore.instance
          .collection('Catgories')
          .get()
          .then((value) {
        for (var item in value.docs) {
          catgories.add(CatgoriesModel.fromJson(data: item.data()));
        }
        emit(GetCatgoriesSucess());
      });
    } on FirebaseException catch (e) {
      catgories = [];
      emit(GetCatgoriesFailure(errMessage: e.toString()));
    }
    print(catgories[0].image);
  }

//************************************************************************************************************************ */
  List<WorkersModel> dataposts = [];
  Future<void> uploadPost() async {
    emit(UploadPostLoading());
    try {
      FirebaseFirestore.instance.collection('${selectedValue}').add({
        "id": FirebaseAuth.instance.currentUser!.uid,
        'image':
            "https://firebasestorage.googleapis.com/v0/b/swssss-98cc5.appspot.com/o/AbdelFattah_Elsisi.jpg?alt=media&token=1ca0862f-38ff-464f-842d-6464b3f3498b",
        'title': title,
        'description': des,
        'price': price,
        'place': place,
      });
      emit(UploadPostSucess());
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      emit(UploadPostFailed(errMessage: e.toString()));
    }
  }

//************************************************************************************************************************ */

  Future<void> uploadProduct() async {
    emit(UploadPostLoading());
    try {
      FirebaseFirestore.instance.collection('souq').add({
        'image':
            "https://firebasestorage.googleapis.com/v0/b/swssss-98cc5.appspot.com/o/101604-6_apple-iphone-13.jpg?alt=media&token=3489257f-92ff-4155-9020-72f86389fd5b",
        'title': title1,
        'description': des1,
        'price': price1,
        'place': place1,
        'uid': uuid.v1(),
      });
      emit(UploadPostSucess());
      print('product upload sucess');
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      emit(UploadPostFailed(errMessage: e.toString()));
    }
  }

//************************************************************************************************************************ */

  Future<void> getProducts() async {
    products.clear();
    emit(GetCatgoriesLoading());
    try {
      await FirebaseFirestore.instance.collection('souq').get().then((value) {
        for (var item in value.docs) {
          products.add(ProductModel.fromJson(data: item.data()));
        }
        emit(GetCatgoriesSucess());
      });
    } on FirebaseException catch (e) {
      catgories = [];
      emit(GetCatgoriesFailure(errMessage: e.toString()));
    }
    print(products[0].image);
  }

  //************************************************************************************************************************ */
  List<UserDataModel> users = [];
  Future<void> getusers() async {
    users.clear();
    emit(GetCatgoriesLoading());
    try {
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var item in value.docs) {
          users.add(UserDataModel.fromJson(item.data()));
        }
        emit(GetCatgoriesSucess());
      });
    } on FirebaseException catch (e) {
      catgories = [];
      emit(GetCatgoriesFailure(errMessage: e.toString()));
    }
    print(users[0].fullname);
  }

  //************************************************************************************************************************ */

  Future<void> getFaviorteList() async {
    faviorteList.clear();
    emit(GetCatgoriesLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('FaviorteList')
          .get()
          .then((value) {
        for (var item in value.docs) {
          faviorteList.add(ProductModel.fromJson(data: item.data()));
        }
        emit(GetCatgoriesSucess());
      });
    } on FirebaseException catch (e) {
      faviorteList = [];
      emit(GetCatgoriesFailure(errMessage: e.toString()));
    }
    print(faviorteList.length);
  }

  //************************************************************************************************************************ */

  Future<void> getWorkers({required name}) async {
    workers.clear();

    emit(GetWorkersLoading());
    try {
      await FirebaseFirestore.instance
          .collection('${name}')
          .get()
          .then((value) {
        for (var item in value.docs) {
          workers.add(WorkersModel.fromJson(data: item.data()));
        }
        emit(GetWorkersSucess());
      });
    } on FirebaseException catch (e) {
      workers = [];
      emit(GetWorkersFailed(errMessage: e.toString()));
    }
  }

//***********************************************************************************************************************************************UserModel */
  Future<void>? getMyData() async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userID ?? CacheHelper.getCacheData(key: 'uid'))
          .get()
          .then((value) {
        userData = UserDataModel.fromJson(value.data()!);

        print(userData!.personType);
      });
    } catch (e) {
      print(e.toString());
    }
  }

//************************************************************************************************************ */
  AddFaviorte({required ProductModel Model}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('FaviorteList')
        .doc(Model.uid)
        .set({
      'title': Model.title,
      'des': Model.des,
      'place': Model.place,
      'price': Model.price,
      'image': Model.image,
    });

    print('AddFaviorte Sucess');
  }

  void removeFaviorte({required String id}) {
    print(id);

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('FaviorteList')
        .doc(id)
        .delete()
        .then((value) {
      print('Faviorte Remove Sucess');
    });
  }

//************************************************************************************************************ */

  void sendMessage(
      {required String message, required String receiverID}) async {
    MessageModel messageModel = MessageModel(
        content: message, date: DateTime.now().toString(), senderID: userID);
    // Save Data on my Document
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .collection("Chat")
        .doc(receiverID)
        .collection("Messages")
        .add(messageModel.toJson());
    print("Message Sent success ......");
    // Save Data on Receiver Document
    await FirebaseFirestore.instance
        .collection("users")
        .doc(receiverID)
        .collection("Chat")
        .doc(userID)
        .collection("Messages")
        .add(messageModel.toJson());
    print("Message Sent xxxx success ......");
    emit(SendMessageSuccessState());
  }

  List<MessageModel> messages = [];

  void getMessages({required String receiverID}) {
    emit(GetMessagesLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('Chat')
        .doc(receiverID)
        .collection('Messages')
        .orderBy('date')
        .snapshots()
        .listen((value) {
      messages.clear();
      for (var item in value.docs) {
        messages.add(MessageModel.fromJson(data: item.data()));
      }
      debugPrint("Messages length is : ${messages.length}");
      emit(GetMessagesSuccessState());
    });
  }

  //***********************************************************************************************************************************************

  List<WorkersModel> workersFiltered = [];
  void searchAboutworker({required String input}) {
    workersFiltered = workers
        .where((element) =>
            element.title!.toLowerCase().contains(input.toLowerCase()))
        .toList();
    print(workersFiltered.length);
  }

//***********************************************************************************************************************************************

  List<ProductModel> productFilter = [];
  void searchAboutproduct({required String input}) {
    productFilter = products
        .where((element) =>
            element.title!.toLowerCase().contains(input.toLowerCase()))
        .toList();
  }
}

  //***********************************************************************************************************************************************


 




//***********************************************************************************************************************************************

