class CatgoriesModel{


  String? name;
  String? image;
  

  CatgoriesModel({required this.name,required this.image});

  // refactoring map | json to Reciive
  CatgoriesModel.fromJson({required Map<String,dynamic> data}){
    name = data['name'];
    image = data['img'];
   
  }

  //ToSend

  Map<String,dynamic> toJson(){
    return {
      'name' : name,
      'image' : image,
    };
  }

}