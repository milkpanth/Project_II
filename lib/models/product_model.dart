class ProductModel {
  String id;
  String nameTh;
  List<Detail> detail;
  String nameEn;
  String sizeUnit;

  ProductModel({this.id, this.nameTh, this.detail, this.nameEn, this.sizeUnit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameTh = json['nameTh'];
    if (json['detail'] != null) {
      detail = new List<Detail>();
      json['detail'].forEach((v) {
        detail.add(new Detail.fromJson(v));
      });
    }
    nameEn = json['nameEn'];
    sizeUnit = json['sizeUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameTh'] = this.nameTh;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['nameEn'] = this.nameEn;
    data['sizeUnit'] = this.sizeUnit;
    return data;
  }
}

class Detail {
  int price;
  int size;

  Detail({this.price, this.size});

  Detail.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['size'] = this.size;
    return data;
  }
}
