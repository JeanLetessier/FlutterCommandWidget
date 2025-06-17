import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 43,
                child: ColoredBox(color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(right: 9)),
              Column(children: [Text("Commande N.254")]),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Color.fromRGBO(185, 28, 28, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      child: IconButton(
        onPressed: () {
          print('delete pressed');
        },
        icon: Icon(Icons.delete_outline_rounded),
        color: Colors.white,
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      child: Container(
        child: IconButton(
          onPressed: () {
            print('card pressed');
          },
          icon: Icon(Icons.credit_card_outlined),
          color: Colors.black,
        ),
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Color.fromRGBO(4, 120, 87, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(
          horizontal: 25.0,
          vertical: 3.0,
        ),
        child: TextButton(
          onPressed: () {
            print('pay pressed');
          },
          child: Text(
            'Payer 275.00€',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
