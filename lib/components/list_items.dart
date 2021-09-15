import 'package:shop_ui/config/app_theme.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    this.height = 150,
    this.topRadius = 0.0,
    this.bottomRadius = 0.0,
    this.title = '',
    this.infoText = '',
    this.price = '',
    this.amount = 1,
    required this.onTap,
  });

  final String title;
  final String price;
  final String infoText;
  final double topRadius;
  final double bottomRadius;
  final double height;
  final int amount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topRadius),
              topRight: Radius.circular(topRadius),
              bottomLeft: Radius.circular(bottomRadius),
              bottomRight: Radius.circular(bottomRadius),
          ),
          color: Color(0xB1CEF0DC),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(
                '$amount x',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title(),
                        _infoText(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _price(),
            _closeButton(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFF2E2D2D),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _infoText() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        infoText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _price() {
    return Expanded(
      child: Text(
        price,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _closeButton() {
    return IconButton(
      onPressed: () {
        print('IconButton pressed ...');
      },
      icon: Icon(
        Icons.close_outlined,
        color: Colors.black,
        size: 16,
      ),
      iconSize: 16,
    );
  }
}
