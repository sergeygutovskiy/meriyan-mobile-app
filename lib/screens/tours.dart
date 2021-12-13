import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meriyan/classes/tour.dart';
import 'package:meriyan/components/tour_list.dart';

class ToursScreen extends StatelessWidget {
  const ToursScreen({ Key? key }) : super(key: key);

  Future<List<Tour>> getTours() async {
    List<Tour> tours = [];
    
    var response = await http.get(Uri.parse('https://meriyan.ru/api/v1/tours'));
    var data = jsonDecode(response.body);
    
    for (var dataEl in data) {
        if (dataEl['price'] == null) continue;
        tours.add(Tour(
            id: dataEl['id'],
            title: dataEl['title'], 
            text: dataEl['description'], 
            price: dataEl['price'],
            imagePath: dataEl['image_path']
        ));
    }

    return tours;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ListView(
          children: [
              Text("Наши туры",
              style: Theme.of(context).textTheme.headline1,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            FutureBuilder<List<Tour>>(
                future: getTours(),
                builder: (context, snapshot) => snapshot.hasData ? TourList(tours: snapshot.requireData) : Text(
                    "Загрузка", 
                    style: Theme.of(context).textTheme.bodyText1),
            ),
          ]
        )
    );
  }
}