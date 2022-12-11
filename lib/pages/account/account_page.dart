import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",size: 24,color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?(userController.isLoading?
        Container(
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
                      AccountWidget(bigText: BigText(text: userController.userModel.name,),
                        appIcon: AppIcon(icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,),),
                      SizedBox(height:Dimensions.height20 ,),

                      //phone
                      AccountWidget(bigText: BigText(text: userController.userModel.phone,),
                        appIcon: AppIcon(icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,),),
                      SizedBox(height:Dimensions.height20 ,),

                      //email
                      AccountWidget(bigText: BigText(text: userController.userModel.email,),
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
                      AccountWidget(bigText: BigText(text: "Messages",),
                        appIcon: AppIcon(icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,),),
                      SizedBox(height:Dimensions.height20 ,),

                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.offNamed(RouteHelper.getSignInPage());
                          }else{
                            print("you logged out");
                          }



                        },
                        child: AccountWidget(bigText: BigText(text: "Logout",),
                          appIcon: AppIcon(icon: Icons.logout,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,),),
                      ),
                      SizedBox(height:Dimensions.height20 ,),


                    ],
                  ),
                ),
              )

            ],
          ),
        )
            :CustomLoader())
            : Container(
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height20*8,
              margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20 ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/image/signintocontinue.png"
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap:(){
                Get.toNamed(RouteHelper.getSignInPage());
              },
              child: Container(

                width: double.maxFinite,
                height: Dimensions.height20*5,
                margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20 ),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),

                ),
                child: Center(child: BigText(text: "Sign in",color: Colors.white,size: Dimensions.font26,)),
              ),
            ),
          ],
        )),);
      },),
    );
  }
}
