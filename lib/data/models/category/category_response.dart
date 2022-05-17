class CategoryResponse {
  CategoryResponse({
    List<Categories>? categories,
    String? count,}){
    _categories = categories;
    _count = count;
  }

  CategoryResponse.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Categories>? _categories;
  String? _count;
  CategoryResponse copyWith({  List<Categories>? categories,
    String? count,
  }) => CategoryResponse(  categories: categories ?? _categories,
    count: count ?? _count,
  );
  List<Categories>? get categories => _categories;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Categories {
  Categories({
    bool? active,
    List<Children>? children,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    bool? wide,}){
    _active = active;
    _children = children;
    _description = description;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _slug = slug;
    _wide = wide;
  }

  Categories.fromJson(dynamic json) {
    _active = json['active'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
    _description = json['description'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _slug = json['slug'];
    _wide = json['wide'];
  }
  bool? _active;
  List<Children>? _children;
  String? _description;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  String? _slug;
  bool? _wide;
  Categories copyWith({  bool? active,
    List<Children>? children,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    bool? wide,
  }) => Categories(  active: active ?? _active,
    children: children ?? _children,
    description: description ?? _description,
    id: id ?? _id,
    image: image ?? _image,
    name: name ?? _name,
    order: order ?? _order,
    slug: slug ?? _slug,
    wide: wide ?? _wide,
  );
  bool? get active => _active;
  List<Children>? get children => _children;
  String? get description => _description;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  String? get slug => _slug;
  bool? get wide => _wide;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    map['slug'] = _slug;
    map['wide'] = _wide;
    return map;
  }

}

class Children {
  Children({
    bool? active,
    List<ChildrenChild>? childrens,
    String? createdAt,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    String? updatedAt,}){
    _active = active;
    _children = childrens;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _slug = slug;
    _updatedAt = updatedAt;
  }

  Children.fromJson(dynamic json) {
    _active = json['active'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(ChildrenChild.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  List<ChildrenChild>? _children;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  String? _slug;
  String? _updatedAt;
  Children copyWith({  bool? active,
    List<ChildrenChild>? children,
    String? createdAt,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    String? updatedAt,
  }) => Children(
    active: active ?? _active,
    childrens: children ?? _children,
    createdAt: createdAt ?? _createdAt,
    description: description ?? _description,
    id: id ?? _id,
    image: image ?? _image,
    name: name ?? _name,
    order: order ?? _order,
    slug: slug ?? _slug,
    updatedAt: updatedAt ?? _updatedAt,
  );
  bool? get active => _active;
  List<ChildrenChild>? get children => _children;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class ChildrenChild {
  ChildrenChild({
    bool? active,
    String? createdAt,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    String? updatedAt,}){
    _active = active;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _slug = slug;
    _updatedAt = updatedAt;
  }

  ChildrenChild.fromJson(dynamic json) {
    _active = json['active'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  String? _slug;
  String? _updatedAt;
  ChildrenChild copyWith({  bool? active,
    String? createdAt,
    String? description,
    String? id,
    String? image,
    String? name,
    String? order,
    String? slug,
    String? updatedAt,
  }) => ChildrenChild(  active: active ?? _active,
    createdAt: createdAt ?? _createdAt,
    description: description ?? _description,
    id: id ?? _id,
    image: image ?? _image,
    name: name ?? _name,
    order: order ?? _order,
    slug: slug ?? _slug,
    updatedAt: updatedAt ?? _updatedAt,
  );
  bool? get active => _active;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    return map;
  }

}