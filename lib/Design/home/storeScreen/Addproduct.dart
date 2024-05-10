
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rushta_app/model/productmodel.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';
import '../../firebase_utils/firebase_utils.dart';

import 'afterAddProducta.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  static const String routeName = 'addProduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var formKey = GlobalKey<FormState>();
  String ProductName = ' ';
  String CategoryProduct = ' ';
  String Price = ' ';
  String OfferPrice = ' ';
  String LocationDetails = ' ';
  String ProductDescription = ' ';

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Add Product',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * .116,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        textAlign: TextAlign.start,
                        'Product Name ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'enter product Name';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        ProductName = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        'Category Product',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'enter Category Product';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        CategoryProduct = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        'Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'enter Price';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        Price = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        'Offer Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Offer Price';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        OfferPrice = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        'Location Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Location Details';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        LocationDetails = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        'Product Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyTheme.grayColor)),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Product Description';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        ProductDescription = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              ProductData productData = ProductData(
                                  pharamacyProduct: ProductName,
                                  CategoryProduct: CategoryProduct,
                                  price: Price,
                                  offerPrice: OfferPrice,
                                  LocationDetails: LocationDetails,
                                  productDescripition: ProductDescription);
                              FireBaseUtils.addProductToFireStore(productData)
                                  .timeout(const Duration(microseconds: 500),
                                      onTimeout: () {
                                listProvider.getDataProduct();
                                Navigator.pushNamed(
                                    context, AfterAddProduct.routName);
                              });
                            }
                          },
                          child: Text(
                            'Add Product ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: MyTheme.whiteColor,
                                    fontWeight: FontWeight.w800),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
