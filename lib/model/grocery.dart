class Grocery {
  String groceryTitle;
  num groceryPrice;
  String groceryImage;
  int groceryQuantity;
  bool itemStatus;

  Grocery({
    required this.groceryTitle,
    required this.groceryPrice,
    required this.groceryImage,
    required this.groceryQuantity,
    required this.itemStatus,
  });

  factory Grocery.fromjson(Map<String, dynamic> parsedjson) {
    return Grocery(
      groceryTitle: parsedjson['title'],
      groceryPrice: parsedjson['price'],
      groceryImage: parsedjson['image'],
      groceryQuantity: 1,
      itemStatus: false,
    );
  }
  static List groceryList(List grocery) {
    List groceries = [];
    for (var i = 0; i < grocery.length; i++) {
      groceries.add(Grocery.fromjson(grocery[i]));
    }
    return groceries;
  }
}
