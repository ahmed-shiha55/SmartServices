class UserDataModel{
  String? fullname;
  String? job;
  String? phone;
  String? email;
  String? userID;
  String? profileImage;
  String? personType;
  bool? isVerifed;
  String? nationalID;
  List?faviorteList;
  UserDataModel({this.email,this.fullname,this.profileImage,this.phone,this.job});
  // NamedConstructor => I will used it when i get Data from fireStore and save it on this model
  UserDataModel.fromJson(Map<String,dynamic> json){
    fullname = json['FullName'];
    job = json['job'];
    phone = json['phone'];
    email = json['email'];
    userID = json['uid'];
    profileImage = json['profileImage'];
    personType=json['type'];
    isVerifed=json['isVerifed'];
    nationalID=json['nationalID'];
    faviorteList=json['faviorteList'];
  }
  // TOJson  => I will used it when i want to  send data to cloud firestore ( Fields )
  Map<String,dynamic> toJson(){
    return {
      'userName' : fullname,
      'job' : job,
      'profileImage' : profileImage,
      'email' : email,
      'uid' : userID,
      'phone' : phone,
      'isVerifed':isVerifed,
    };
  }
}