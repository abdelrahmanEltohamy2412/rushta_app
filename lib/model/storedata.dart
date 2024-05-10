class StoreData {
  static const String collectionName= 'StoreData';
  String? id;

  String? pharamacyName;

  String? webAdress;

  String? storeDescripiton;

  String? numberOfBranches;

  String? BranchesAdrees;

  String? country;

  String? phoneNumber;

  StoreData({
    this.id = ' ',
    required this.pharamacyName,
    required this.webAdress,
    required this.storeDescripiton,
    required this.numberOfBranches,
    required this.BranchesAdrees,
    required this.country,
    required this.phoneNumber,});
   StoreData.fromJson(Map<String , dynamic > json): this(
    id : json['id'],
    pharamacyName: json['pharamacyName'],
    webAdress: json['webAdress'],
    storeDescripiton: json['storeDescripiton'],
    numberOfBranches: json['numberOfBranches'],
    BranchesAdrees: json['BranchesAdrees'],
    country: json['country'],
    phoneNumber: json['phoneNumber'],);

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pharamacyName': pharamacyName,
      'webAdress': webAdress,
      'storeDescripiton': storeDescripiton,
      'numberOfBranches': numberOfBranches,
      'BranchesAdrees': BranchesAdrees,
      'country': country,
      'phoneNumber': phoneNumber
    };
  }
}
