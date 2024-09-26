import 'package:flutter/material.dart';
import 'package:shopping_app_sample/constants/color_constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  
    
          Container(color:ColorConstants.primaryColor ,
             child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Text(title,style: TextStyle(color: ColorConstants.secondaryColor,fontSize: 25,fontWeight: FontWeight.bold),),
               )
              ],
                     ),
           )
         ;
      
    
  }
}