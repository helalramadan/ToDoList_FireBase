class TodoUserModle {
  String? title;
  String? email;
  String? phone;
  String? name;
  String? image;
  String? date;
  String? cover;
  String? time;
  String? uId;
  String? Id;
  bool? isCheked;

  TodoUserModle({
    this.title,
    this.email,
    this.phone,
    this.name,
    this.Id,
    this.uId,
    this.image,
    this.cover,
    this.time,
    this.date,
    this.isCheked,
  });
  TodoUserModle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    Id = json['Id'];
    image = json['image'];
    cover = json['cover'];
    time = json['time'];
    date = json['date'];
    isCheked = json['isCheked'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'email': email,
      'phone': phone,
      'uId': uId,
      'Id': Id,
      'image': image,
      'cover': cover,
      'time': time,
      'date': date,
      'isCheked': isCheked,
    };
  }
}
