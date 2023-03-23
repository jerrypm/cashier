class MenuModel {
  String? message;
  List<DataSubModel>? data;

  MenuModel({this.message, this.data});

  MenuModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSubModel>[];
      json['data'].forEach((v) {
        data!.add(DataSubModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSubModel {
  String? imageUrl;
  String? desc;
  String? title;
  double? price;
  List<String>? ingredient;

  DataSubModel({
    this.imageUrl,
    this.title,
    this.desc,
    this.price,
  });

  DataSubModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    ingredient = json['ingredient'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['title'] = title;
    data['desc'] = desc;
    data['price'] = price;
    data['ingredient'] = ingredient;
    return data;
  }
}
