class ProductResponse {
  ProductResponse({
    Product? product,
  }) {
    _product = product;
  }

  ProductResponse.fromJson(dynamic json) {
    _product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Product? _product;

  ProductResponse copyWith({
    Product? product,
  }) =>
      ProductResponse(
        product: product ?? _product,
      );

  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}

class Product {
  Product({
    String? id,
    String? name,
    String? slug,
    String? previewText,
    String? description,
    String? characteristics,
    String? youTubeLink,
    bool? active,
    List<Properties>? properties,
    Price? price,
    String? image,
    List<dynamic>? gallery,
    int? averageRate,
    String? reviewsCount,
    Meta? meta,
    String? order,
    int? cheapestPrice,
    String? code,
    List<Variants>? variants,
    Category? category,
    int? discount,
    int? installmentAmount,
    int? warrantyPeriod,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _previewText = previewText;
    _description = description;
    _characteristics = characteristics;
    _youTubeLink = youTubeLink;
    _active = active;
    _properties = properties;
    _price = price;
    _image = image;
    _gallery = gallery;
    _averageRate = averageRate;
    _reviewsCount = reviewsCount;
    _meta = meta;
    _order = order;
    _cheapestPrice = cheapestPrice;
    _code = code;
    _variants = variants;
    _category = category;
    _discount = discount;
    _installmentAmount = installmentAmount;
    _warrantyPeriod = warrantyPeriod;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _previewText = json['preview_text'];
    _description = json['description'];
    _characteristics = json['characteristics'];
    _youTubeLink = json['you_tube_link'];
    _active = json['active'];
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _image = json['image'];
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Dynamic.fromJson(v));
      });
    }
    _averageRate = json['average_rate'];
    _reviewsCount = json['reviews_count'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _order = json['order'];
    _cheapestPrice = json['cheapest_price'];
    _code = json['code'];
    if (json['variants'] != null) {
      _variants = [];
      json['variants'].forEach((v) {
        _variants?.add(Variants.fromJson(v));
      });
    }
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _discount = json['discount'];
    _installmentAmount = json['installment_amount'];
    _warrantyPeriod = json['warranty_period'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _previewText;
  String? _description;
  String? _characteristics;
  String? _youTubeLink;
  bool? _active;
  List<Properties>? _properties;
  Price? _price;
  String? _image;
  List<dynamic>? _gallery;
  int? _averageRate;
  String? _reviewsCount;
  Meta? _meta;
  String? _order;
  int? _cheapestPrice;
  String? _code;
  List<Variants>? _variants;
  Category? _category;
  int? _discount;
  int? _installmentAmount;
  int? _warrantyPeriod;

  Product copyWith({
    String? id,
    String? name,
    String? slug,
    String? previewText,
    String? description,
    String? characteristics,
    String? youTubeLink,
    bool? active,
    List<Properties>? properties,
    Price? price,
    String? image,
    List<dynamic>? gallery,
    int? averageRate,
    String? reviewsCount,
    Meta? meta,
    String? order,
    int? cheapestPrice,
    String? code,
    List<Variants>? variants,
    Category? category,
    int? discount,
    int? installmentAmount,
    int? warrantyPeriod,
  }) =>
      Product(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        previewText: previewText ?? _previewText,
        description: description ?? _description,
        characteristics: characteristics ?? _characteristics,
        youTubeLink: youTubeLink ?? _youTubeLink,
        active: active ?? _active,
        properties: properties ?? _properties,
        price: price ?? _price,
        image: image ?? _image,
        gallery: gallery ?? _gallery,
        averageRate: averageRate ?? _averageRate,
        reviewsCount: reviewsCount ?? _reviewsCount,
        meta: meta ?? _meta,
        order: order ?? _order,
        cheapestPrice: cheapestPrice ?? _cheapestPrice,
        code: code ?? _code,
        variants: variants ?? _variants,
        category: category ?? _category,
        discount: discount ?? _discount,
        installmentAmount: installmentAmount ?? _installmentAmount,
        warrantyPeriod: warrantyPeriod ?? _warrantyPeriod,
      );

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  String? get previewText => _previewText;

  String? get description => _description;

  String? get characteristics => _characteristics;

  String? get youTubeLink => _youTubeLink;

  bool? get active => _active;

  List<Properties>? get properties => _properties;

  Price? get price => _price;

  String? get image => _image;

  List<dynamic>? get gallery => _gallery;

  int? get averageRate => _averageRate;

  String? get reviewsCount => _reviewsCount;

  Meta? get meta => _meta;

  String? get order => _order;

  int? get cheapestPrice => _cheapestPrice;

  String? get code => _code;

  List<Variants>? get variants => _variants;

  Category? get category => _category;

  int? get discount => _discount;

  int? get installmentAmount => _installmentAmount;

  int? get warrantyPeriod => _warrantyPeriod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['preview_text'] = _previewText;
    map['description'] = _description;
    map['characteristics'] = _characteristics;
    map['you_tube_link'] = _youTubeLink;
    map['active'] = _active;
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    map['image'] = _image;
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    map['average_rate'] = _averageRate;
    map['reviews_count'] = _reviewsCount;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['order'] = _order;
    map['cheapest_price'] = _cheapestPrice;
    map['code'] = _code;
    if (_variants != null) {
      map['variants'] = _variants?.map((v) => v.toJson()).toList();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['discount'] = _discount;
    map['installment_amount'] = _installmentAmount;
    map['warranty_period'] = _warrantyPeriod;
    return map;
  }
}

class Dynamic {
  static fromJson(v) {}
}

class Category {
  Category({
    String? id,
    String? name,
    String? slug,
    Parent? parent,
    bool? active,
    String? order,
    String? image,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _parent = parent;
    _active = active;
    _order = order;
    _image = image;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    _active = json['active'];
    _order = json['order'];
    _image = json['image'];
  }

  String? _id;
  String? _name;
  String? _slug;
  Parent? _parent;
  bool? _active;
  String? _order;
  String? _image;

  Category copyWith({
    String? id,
    String? name,
    String? slug,
    Parent? parent,
    bool? active,
    String? order,
    String? image,
  }) =>
      Category(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        parent: parent ?? _parent,
        active: active ?? _active,
        order: order ?? _order,
        image: image ?? _image,
      );

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  Parent? get parent => _parent;

  bool? get active => _active;

  String? get order => _order;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    map['active'] = _active;
    map['order'] = _order;
    map['image'] = _image;
    return map;
  }
}

class Parent {
  Parent({
    String? id,
    String? name,
    String? slug,
    bool? active,
    String? description,
    String? order,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _active = active;
    _description = description;
    _order = order;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Parent.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _active = json['active'];
    _description = json['description'];
    _order = json['order'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  String? _id;
  String? _name;
  String? _slug;
  bool? _active;
  String? _description;
  String? _order;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  Parent copyWith({
    String? id,
    String? name,
    String? slug,
    bool? active,
    String? description,
    String? order,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Parent(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        active: active ?? _active,
        description: description ?? _description,
        order: order ?? _order,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  bool? get active => _active;

  String? get description => _description;

  String? get order => _order;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['active'] = _active;
    map['description'] = _description;
    map['order'] = _order;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Variants {
  Variants({
    String? name,
    Value? value,
  }) {
    _name = name;
    _value = value;
  }

  Variants.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'] != null ? Value.fromJson(json['value']) : null;
  }

  String? _name;
  Value? _value;

  Variants copyWith({
    String? name,
    Value? value,
  }) =>
      Variants(
        name: name ?? _name,
        value: value ?? _value,
      );

  String? get name => _name;

  Value? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_value != null) {
      map['value'] = _value?.toJson();
    }
    return map;
  }
}

class Value {
  Value({
    String? id,
    String? name,
    String? slug,
    String? previewText,
    bool? active,
    Price? price,
    String? image,
    List<String>? gallery,
    String? lang,
    String? description,
    String? characteristics,
    int? installmentAmount,
    int? warrantyPeriod,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _previewText = previewText;
    _active = active;
    _price = price;
    _image = image;
    _gallery = gallery;
    _lang = lang;
    _description = description;
    _characteristics = characteristics;
    _installmentAmount = installmentAmount;
    _warrantyPeriod = warrantyPeriod;
  }

  Value.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _previewText = json['preview_text'];
    _active = json['active'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _image = json['image'];
    _gallery = json['gallery'] != null ? json['gallery'].cast<String>() : [];
    _lang = json['lang'];
    _description = json['description'];
    _characteristics = json['characteristics'];
    _installmentAmount = json['installment_amount'];
    _warrantyPeriod = json['warranty_period'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _previewText;
  bool? _active;
  Price? _price;
  String? _image;
  List<String>? _gallery;
  String? _lang;
  String? _description;
  String? _characteristics;
  int? _installmentAmount;
  int? _warrantyPeriod;

  Value copyWith({
    String? id,
    String? name,
    String? slug,
    String? previewText,
    bool? active,
    Price? price,
    String? image,
    List<String>? gallery,
    String? lang,
    String? description,
    String? characteristics,
    int? installmentAmount,
    int? warrantyPeriod,
  }) =>
      Value(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        previewText: previewText ?? _previewText,
        active: active ?? _active,
        price: price ?? _price,
        image: image ?? _image,
        gallery: gallery ?? _gallery,
        lang: lang ?? _lang,
        description: description ?? _description,
        characteristics: characteristics ?? _characteristics,
        installmentAmount: installmentAmount ?? _installmentAmount,
        warrantyPeriod: warrantyPeriod ?? _warrantyPeriod,
      );

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  String? get previewText => _previewText;

  bool? get active => _active;

  Price? get price => _price;

  String? get image => _image;

  List<String>? get gallery => _gallery;

  String? get lang => _lang;

  String? get description => _description;

  String? get characteristics => _characteristics;

  int? get installmentAmount => _installmentAmount;

  int? get warrantyPeriod => _warrantyPeriod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['preview_text'] = _previewText;
    map['active'] = _active;
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    map['image'] = _image;
    map['gallery'] = _gallery;
    map['lang'] = _lang;
    map['description'] = _description;
    map['characteristics'] = _characteristics;
    map['installment_amount'] = _installmentAmount;
    map['warranty_period'] = _warrantyPeriod;
    return map;
  }
}

class Price {
  Price({
    int? price,
    int? oldPrice,
    int? uzsPrice,
    int? secondPrice,
    int? secondUzsPrice,
  }) {
    _price = price;
    _oldPrice = oldPrice;
    _uzsPrice = uzsPrice;
    _secondPrice = secondPrice;
    _secondUzsPrice = secondUzsPrice;
  }

  Price.fromJson(dynamic json) {
    _price = json['price'];
    _oldPrice = json['old_price'];
    _uzsPrice = json['uzs_price'];
    _secondPrice = json['second_price'];
    _secondUzsPrice = json['second_uzs_price'];
  }

  int? _price;
  int? _oldPrice;
  int? _uzsPrice;
  int? _secondPrice;
  int? _secondUzsPrice;

  Price copyWith({
    int? price,
    int? oldPrice,
    int? uzsPrice,
    int? secondPrice,
    int? secondUzsPrice,
  }) =>
      Price(
        price: price ?? _price,
        oldPrice: oldPrice ?? _oldPrice,
        uzsPrice: uzsPrice ?? _uzsPrice,
        secondPrice: secondPrice ?? _secondPrice,
        secondUzsPrice: secondUzsPrice ?? _secondUzsPrice,
      );

  int? get price => _price;

  int? get oldPrice => _oldPrice;

  int? get uzsPrice => _uzsPrice;

  int? get secondPrice => _secondPrice;

  int? get secondUzsPrice => _secondUzsPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    map['uzs_price'] = _uzsPrice;
    map['second_price'] = _secondPrice;
    map['second_uzs_price'] = _secondUzsPrice;
    return map;
  }
}

class Meta {
  Meta({
    String? title,
    String? description,
    String? tags,
  }) {
    _title = title;
    _description = description;
    _tags = tags;
  }

  Meta.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _tags = json['tags'];
  }

  String? _title;
  String? _description;
  String? _tags;

  Meta copyWith({
    String? title,
    String? description,
    String? tags,
  }) =>
      Meta(
        title: title ?? _title,
        description: description ?? _description,
        tags: tags ?? _tags,
      );

  String? get title => _title;

  String? get description => _description;

  String? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['tags'] = _tags;
    return map;
  }
}

class Prices {
  Prices({
    int? price,
    int? oldPrice,
    int? uzsPrice,
    int? secondPrice,
    int? secondUzsPrice,
  }) {
    _price = price;
    _oldPrice = oldPrice;
    _uzsPrice = uzsPrice;
    _secondPrice = secondPrice;
    _secondUzsPrice = secondUzsPrice;
  }

  Prices.fromJson(dynamic json) {
    _price = json['price'];
    _oldPrice = json['old_price'];
    _uzsPrice = json['uzs_price'];
    _secondPrice = json['second_price'];
    _secondUzsPrice = json['second_uzs_price'];
  }

  int? _price;
  int? _oldPrice;
  int? _uzsPrice;
  int? _secondPrice;
  int? _secondUzsPrice;

  Prices copyWith({
    int? price,
    int? oldPrice,
    int? uzsPrice,
    int? secondPrice,
    int? secondUzsPrice,
  }) =>
      Prices(
        price: price ?? _price,
        oldPrice: oldPrice ?? _oldPrice,
        uzsPrice: uzsPrice ?? _uzsPrice,
        secondPrice: secondPrice ?? _secondPrice,
        secondUzsPrice: secondUzsPrice ?? _secondUzsPrice,
      );

  int? get price => _price;

  int? get oldPrice => _oldPrice;

  int? get uzsPrice => _uzsPrice;

  int? get secondPrice => _secondPrice;

  int? get secondUzsPrice => _secondUzsPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    map['uzs_price'] = _uzsPrice;
    map['second_price'] = _secondPrice;
    map['second_uzs_price'] = _secondUzsPrice;
    return map;
  }
}

class Properties {
  Properties({
    String? id,
    Property? property,
    List<Values>? value,
  }) {
    _id = id;
    _property = property;
    _value = value;
  }

  Properties.fromJson(dynamic json) {
    _id = json['id'];
    _property =
        json['property'] != null ? Property.fromJson(json['property']) : null;
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(Values.fromJson(v));
      });
    }
  }

  String? _id;
  Property? _property;
  List<Values>? _value;

  Properties copyWith({
    String? id,
    Property? property,
    List<Values>? value,
  }) =>
      Properties(
        id: id ?? _id,
        property: property ?? _property,
        value: value ?? _value,
      );

  String? get id => _id;

  Property? get property => _property;

  List<Values>? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_property != null) {
      map['property'] = _property?.toJson();
    }
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Values {
  Values({
    String? name,
    String? value,
    String? extra,
    String? order,
  }) {
    _name = name;
    _value = value;
    _extra = extra;
    _order = order;
  }

  Values.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
    _extra = json['extra'];
    _order = json['order'];
  }

  String? _name;
  String? _value;
  String? _extra;
  String? _order;

  Values copyWith({
    String? name,
    String? value,
    String? extra,
    String? order,
  }) =>
      Values(
        name: name ?? _name,
        value: value ?? _value,
        extra: extra ?? _extra,
        order: order ?? _order,
      );

  String? get name => _name;

  String? get value => _value;

  String? get extra => _extra;

  String? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    map['extra'] = _extra;
    map['order'] = _order;
    return map;
  }
}

class Property {
  Property({
    String? id,
    String? name,
    String? slug,
    String? type,
    bool? active,
    String? description,
    String? order,
    String? lang,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _type = type;
    _active = active;
    _description = description;
    _order = order;
    _lang = lang;
  }

  Property.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
    _active = json['active'];
    _description = json['description'];
    _order = json['order'];
    _lang = json['lang'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _type;
  bool? _active;
  String? _description;
  String? _order;
  String? _lang;

  Property copyWith({
    String? id,
    String? name,
    String? slug,
    String? type,
    bool? active,
    String? description,
    String? order,
    String? lang,
  }) =>
      Property(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        type: type ?? _type,
        active: active ?? _active,
        description: description ?? _description,
        order: order ?? _order,
        lang: lang ?? _lang,
      );

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  String? get type => _type;

  bool? get active => _active;

  String? get description => _description;

  String? get order => _order;

  String? get lang => _lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['type'] = _type;
    map['active'] = _active;
    map['description'] = _description;
    map['order'] = _order;
    map['lang'] = _lang;
    return map;
  }
}
