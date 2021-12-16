import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meriyan/classes/tour.dart';
import 'package:http/http.dart' as http;
import 'package:meriyan/components/tour_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({ Key? key }) : super(key: key);

  Future<List<Tour>> getTours() async {
    List<Tour> tours = [];
    List<Tour> toursFav = [];
    
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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> fav = prefs.getStringList('favourites') ?? [];

    for(var tour in tours) {
        if (fav.contains(tour.id.toString())) { toursFav.add(tour); }
    }

    return toursFav;
  }

  get future => null;

  @override
  Widget build(BuildContext context) {
    return Container(

        color: Colors.white,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          padding: const EdgeInsets.only(top: 32),
          children: [
                Text("Избранное",
                style: Theme.of(context).textTheme.headline1
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