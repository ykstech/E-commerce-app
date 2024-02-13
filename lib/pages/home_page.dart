import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/pages/profile.dart';
import 'package:shop_app_flutter/widgets/product_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage(),ProfilePage()];






  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: false,
            body: PageTransitionSwitcher(
              duration:const Duration(seconds: 1),
              transitionBuilder: (child,animation,secondaryAnimation)=> FadeThroughTransition(animation: animation, secondaryAnimation: secondaryAnimation,child: child,),              
              child: pages[currentPage],
             ),
          bottomNavigationBar: Theme(
            data:Theme.of(context).copyWith(
              iconTheme:const IconThemeData(color: Colors.black87)
            ),
            child: CurvedNavigationBar(
                  
                  index: 0,
                  height: 60.0,
                  items: const <Widget>[
                    Icon(Icons.home, size: 30),
                    Icon(Icons.shopping_cart, size: 30),
                    Icon(Icons.person_2, size: 30),
                  ],
                  color:Theme.of(context).primaryColor ,
                  buttonBackgroundColor: Color.fromRGBO(216, 240, 253, 1),
                  backgroundColor: Colors.transparent,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  onTap: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  letIndexChange: (index) => true,
                ),
          ),
          
          
          ),
        ),
      ),
    );
  }
}
