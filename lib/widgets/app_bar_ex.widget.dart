import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors_constants.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Messages.png')

                  ),
              Positioned(
                  bottom: 6,
                  child: Badge(
                    backgroundColor: ColorsConstants.badgeColor,
                    label: Text('5'),
                  ))
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ColorsConstants.iconColor,
                ),
              ),
              Positioned(
                  bottom: 6,
                  child: Badge(
                    backgroundColor: ColorsConstants.badgeColor,
                    label: Text('5'),
                  ))
            ],
          ),
        ],
      );


}

