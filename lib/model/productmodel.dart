class ProductData {
  static const String collectionName= 'productData';
  String? id;



  String? pharamacyProduct;

  String? CategoryProduct;

  String? price;

  String? offerPrice;

  String? LocationDetails;

  String? productDescripition;



  ProductData({
    this.id = ' ',
    required this.pharamacyProduct,
    required this.CategoryProduct,
    required this.price,
    required this.offerPrice,
    required this.LocationDetails,
    required this.productDescripition,});
  ProductData.fromJson(Map<String , dynamic > json): this(
    id : json['id'],
    pharamacyProduct: json['pharamacyProduct'],
    CategoryProduct: json['CategoryProduct'],
    price: json['price'],
    offerPrice: json['offerPrice'],
    LocationDetails: json['LocationDetails'],
    productDescripition: json['productDescripition'],

);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pharamacyProduct': pharamacyProduct,
      'CategoryProduct': CategoryProduct,
      'price': price,
      'offerPrice': offerPrice,
      'LocationDetails': LocationDetails,
      'productDescripition': productDescripition,

    };
  }
}
