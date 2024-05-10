import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rushta_app/mytheme.dart';

class CustomTextFormFilled extends StatelessWidget {
   CustomTextFormFilled({super.key,required this.label,
   required this.iconData,
     required this.validator,
      required this.onChanged,


   });
  String label ;
  IconData iconData;
   String? Function(String?)? validator;
   void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
            color: MyTheme.primaryColor,
                width: 2
        )
        ),
        prefixIcon: Icon(iconData,color: MyTheme.primaryColor,),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: MyTheme.primaryColor,
                width: 2
            )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2
          )
        )

      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
