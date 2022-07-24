import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",size: 24,color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(icon: Icons.person,
               backgroundColor: AppColors.mainColor,
                 iconColor: Colors.white,
                 iconSize: Dimensions.height45+Dimensions.height30,
                 size: Dimensions.height15*10,),
            SizedBox(height:Dimensions.height30 ,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(bigText: BigText(text: "Shimul Tamo",),
                      appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),),
                    SizedBox(height:Dimensions.height20 ,),

                    //phone
                    AccountWidget(bigText: BigText(text: "123456789",),
                      appIcon: AppIcon(icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),),
                    SizedBox(height:Dimensions.height20 ,),

                    //email
                    AccountWidget(bigText: BigText(text: "shimul@gmail.com",),
                      appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),),
                    SizedBox(height:Dimensions.height20 ,),

                    //address
                    AccountWidget(bigText: BigText(text: "Fill in your address",),
                      appIcon: AppIcon(icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),),
                    SizedBox(height:Dimensions.height20 ,),

                    //message
                    AccountWidget(bigText: BigText(text: "Shimul Tamo",),
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),),
                    SizedBox(height:Dimensions.height20 ,),


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
