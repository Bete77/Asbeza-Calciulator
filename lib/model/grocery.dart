class Grocery {
  String groceryTitle;
  num groceryPrice;
  String groceryImage;

  Grocery({
    required this.groceryTitle,
    required this.groceryPrice,
    required this.groceryImage,
  });

  factory Grocery.fromjson(Map<String, dynamic> parsedjson) {
    return Grocery(
      groceryTitle: parsedjson['title'],
      groceryPrice: parsedjson['price'],
      groceryImage: parsedjson['image'],
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
