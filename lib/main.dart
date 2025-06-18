import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var commandItems = <CommandItem>[
    CommandItem(amount: 1, price: 100.0, name: 'Adulte'),
    CommandItem(amount: 1, price: 100.0, name: 'Adulte'),
    CommandItem(amount: 1, price: 75.0, name: 'Enfant 4-11 ans'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              // Top command information row
              Row(
                children: [
                  SizedBox(
                    width: 3,
                    height: 30,
                    child: ColoredBox(color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(right: 9)),
                  Column(
                    children: [
                      Text("Commande N.254", textAlign: TextAlign.left),
                      Text('Anonyme', textAlign: TextAlign.left),
                    ],
                  ),
                  Spacer(),
                  RoundedSquareIconButton(
                    onPressed: () {
                      print('person button pressed');
                    },
                    icon: Icon(Icons.person_outline_rounded),
                    backgroundColor: Color.fromRGBO(127, 29, 29, 1),
                    iconColor: Color.fromRGBO(247, 241, 241, 1),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              // item list
              Column(
                children: [for (var commandItem in commandItems) commandItem],
              ),
              Spacer(),
              // Button row
              Row(
                children: [
                  // Delete button
                  RoundedSquareIconButton(
                    icon: Icon(Icons.delete_outline_rounded),
                    backgroundColor: Color.fromRGBO(185, 28, 28, 1),
                    iconColor: Color.fromRGBO(247, 241, 241, 1),
                    onPressed: () {
                      print('delete button pressed');
                    },
                  ),
                  Padding(padding: EdgeInsets.only(right: 7)),
                  // Card button
                  RoundedSquareIconButton.outlined(
                    icon: Icon(Icons.credit_card_outlined),
                    backgroundColor: Color.fromRGBO(249, 250, 251, 1),
                    iconColor: Color.fromRGBO(55, 65, 81, 1),
                    onPressed: () {
                      print('card button pressed');
                    },
                  ),
                  Padding(padding: EdgeInsets.only(right: 7)),
                  Expanded(
                    child: RoundedSquareElevatedButton(
                      backgroundColor: Color.fromRGBO(4, 120, 87, 1),
                      text: 'Payer 275,00€',
                      textColor: Color.fromRGBO(247, 241, 241, 1),
                      onPressed: () {
                        print('pressed pay button');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedSquareElevatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedSquareElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 26, vertical: 9.5),
        child: Text(text),
      ),
    );
  }
}

class RoundedSquareIconButton extends StatelessWidget {
  final Icon icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final bool outlined;

  const RoundedSquareIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
    this.outlined = false,
  });

  const RoundedSquareIconButton.outlined({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
    this.outlined = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!outlined) {
      return IconButton(
        onPressed: onPressed,
        icon: icon,
        color: iconColor,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: backgroundColor,
        ),
      );
    } else {
      return IconButton.outlined(
        onPressed: onPressed,
        icon: icon,
        color: iconColor,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }
}

class CommandItem extends StatelessWidget {
  final int amount;
  final double price;
  final String name;

  const CommandItem({
    super.key,
    required this.amount,
    required this.price,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            children: [
              Text('${amount}x'),
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(name),
              Spacer(),
              Text(
                '${price.toStringAsFixed(2).replaceAll(RegExp(r'\.'), ',')}€',
              ),
            ],
          ),
        ),
        Divider(color: Color.fromRGBO(209, 213, 219, 1)),
      ],
    );
  }
}
