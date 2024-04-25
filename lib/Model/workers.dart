class WorkersModel{


  String? title;
  String? des;
  String? image;
  String? price;
  String? place;
  String? id;
  

  WorkersModel({required this.title,required this.image ,required this.des , required this.place ,required this.price});

  // refactoring map | json to Reciive
  WorkersModel.fromJson({required Map<String,dynamic> data}){
    title = data['title'];
    image = data['image'];
    des = data['description'];
    price = data['price'];
    place = data['place'];
     id = data['id'];
    
   
  }



}