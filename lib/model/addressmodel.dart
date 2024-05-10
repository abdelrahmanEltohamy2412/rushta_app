class AddressData {
  static const String collectionName= 'AddressData';
  String? addressId;



  String? name;
  String? phone;


  String? streetAddress;

  String? city;

  String? flat;





  AddressData({
    this.addressId = ' ',
    required this.name,
    required this.phone,
    required this.streetAddress,
    required this.city,
    required this.flat,
   });
  AddressData.fromJson(Map<String , dynamic > json): this(
    addressId : json['addressId'],
    phone : json['phone'],

    name: json['name'],
    streetAddress: json['streetAddress'],
    city: json['city'],
    flat: json['flat'],


  );

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,

      'name': name,
      'phone': phone,

      'streetAddress': streetAddress,
      'city': city,
      'flat': flat,


    };
  }
}
