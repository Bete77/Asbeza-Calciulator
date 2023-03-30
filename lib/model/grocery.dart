class Grocery {
  int id;
  String groceryTitle;
  num groceryPrice;
  String groceryImage;
  int groceryQuantity;
  int itemStatus;

  Grocery({
    required this.id,
    required this.groceryTitle,
    required this.groceryPrice,
    required this.groceryImage,
    required this.groceryQuantity,
    required this.itemStatus,
  });

  factory Grocery.fromjson(Map<String, dynamic> parsedjson) {
    return Grocery(
      id: parsedjson['id'],
      groceryTitle: parsedjson['title'],
      groceryPrice: parsedjson['price'],
      groceryImage: parsedjson['image'],
      groceryQuantity: 1,
      itemStatus: 0,
    );
  }

  factory Grocery.cartfromJson(Map<String, dynamic> parsedJson) {
    return Grocery(
      id: parsedJson["id"],
      groceryTitle: parsedJson["groceryTitle"],
      groceryPrice: parsedJson["groceryPrice"],
      groceryImage: parsedJson["groceryImage"],
      groceryQuantity: parsedJson["groceryQuantity"],
      itemStatus: parsedJson["itemStatus"],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['groceryTitle'] = groceryTitle;
    json['groceryPrice'] = groceryPrice;
    json['groceryImage'] = groceryImage;
    json['groceryQuantity'] = groceryQuantity;
    json['itemStatus'] = itemStatus;
    return json;
  }

  static List groceryList(List grocery) {
    List groceries = [];
    for (var i = 0; i < grocery.length; i++) {
      groceries.add(Grocery.fromjson(grocery[i]));
    }
    return groceries;
  }

  static List cartList(List grocery) {
    List groceries = [];
    for (var i = 0; i < grocery.length; i++) {
      groceries.add(Grocery.cartfromJson(grocery[i]));
    }
    return groceries;
  }
}
