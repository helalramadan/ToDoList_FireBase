class TodoUserModle {
  String? titel;
  String? email;
  String? phone;
  String? name;
  String? image;
  String? date;
  String? cover;
  String? time;
  String? uId;
  String? Id;
  bool? isEmailVerified;

  TodoUserModle({
    this.titel,
    this.email,
    this.phone,
    this.name,
    this.Id,
    this.uId,
    this.image,
    this.cover,
    this.time,
    this.date,
    this.isEmailVerified,
  });
  TodoUserModle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    titel = json['titel'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    Id = json['Id'];
    image = json['image'];
    cover = json['cover'];
    time = json['time'];
    date = json['date'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': titel,
      'email': email,
      'phone': phone,
      'uId': uId,
      'Id': Id,
      'image': image,
      'cover': cover,
      'time': time,
      'date': date,
      'isEmailVerified': isEmailVerified,
    };
  }
}
