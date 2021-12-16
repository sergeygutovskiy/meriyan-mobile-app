import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TourForm extends StatefulWidget {
  const TourForm({ Key? key }) : super(key: key);

  @override
  _TourFormState createState() => _TourFormState();
}

class _TourFormState extends State<TourForm> {
  
  String name = 'Человек';
  String number = '9111111111';
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
               "Забронировать тур",
                style: Theme.of(context).textTheme.headline2,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            TextField(

                onChanged: (value) => setState(() {
                  name = value;
                }),

                decoration: InputDecoration(
                    hintText: "name",
                    hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic
                    ),
                    prefixText: "I'm ",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: 
                            BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0
                            )
                    ),
                ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            TextField(

                keyboardType: TextInputType.phone,
                maxLength: 10,

                onChanged: (value) => setState(() {
                  number = value;
                }),

                 decoration: const InputDecoration(
                    hintText: "номер телефона",
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic
                    ),
                    prefixText: " +7 "
                ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12)),

            CupertinoButton(
                    color: Theme.of(context).primaryColor,
                    child: const Text("Отправить"), 
                    onPressed: () =>  showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                            title: Text("Забронировано", style: Theme.of(context).textTheme.headline2),
                            content: Text("Спасибо, $name, за бронирование! Мы позвоним на номер: +7 $number", 
                                style: Theme.of(context).textTheme.bodyText1),
                            actions: [
                                TextButton(
                                    onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        } ,
                                    child: Text('OK', style: TextStyle(color: Theme.of(context).primaryColor)),
                                ),
                            ],
                        )
                    )
            )
        ],
      )
    );
  }
}