class ProductModel {
  String? title;
  String? des;
  String? image;
  String? price;
  String? place;
  String? uid;

  ProductModel(
      {required this.title,
      required this.image,
      required this.des,
      required this.place,
      required this.price,
      required this.uid});

  // refactoring map | json to Reciive
  ProductModel.fromJson({required Map<String, dynamic> data}) {
    title = data['title'];
    image = data['image'];
    des = data['description'];
    price = data['price'];
    place = data['place'];
    uid = data['uid'];
  }

  Map<String, dynamic> converter() {
    return {
      'title': title,
      'image': image,
      'des': des,
      'price': price,
      'place': place,
      'uid': uid,
    };
  }
}
