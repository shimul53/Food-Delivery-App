import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  static String getSplashPage()=>'$splashPage';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId,String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId,String page)=> '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=> '$cartPage';
  static String getSignInPage()=> '$signIn';


  static List<GetPage> routes = [
    //splash screen
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    //main food page
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: signIn, page: ()=>SignInPage(),transition:Transition.fade ),

    //popular food page
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetails(pageId:int.parse(pageId!),page:page!);
    },
    transition: Transition.fadeIn
    ),

    //recommended food page
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetails(pageId:int.parse(pageId!),page:page!);
    },
        transition: Transition.fadeIn
    ),
    //cart page
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
        transition: Transition.fadeIn
    )
  ];
}