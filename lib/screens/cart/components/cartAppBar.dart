import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/cartServices/cartCounter.dart';
import 'package:shop_app/services/cartServices/cartItemDeleter.dart';
import '../../../basicFiles/constants.dart';

AppBar cartAppBar(BuildContext context, Function() updateCart,String userInfo) {
  final cartCounter = Provider.of<CartCounter>(context, listen: false);
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () async {
            final cartCount = await deleteCart(userInfo, 0);
            if (cartCount >= 0) {
              updateCart();
              cartCounter.updateCartCount(cartCount);
            }
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ]);
}
