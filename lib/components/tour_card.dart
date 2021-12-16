import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meriyan/classes/tour.dart';
import 'package:meriyan/components/tour_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TourCard extends StatefulWidget {
  const TourCard({ Key? key, required this.tour }) : super(key: key);

  final Tour tour;

  @override
  State<TourCard> createState() => _TourCardState();
}

class _TourCardState extends State<TourCard> {

  bool isFavourite = false;

  @override
  void initState() {
      super.initState();
      load();
  }

  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tours = prefs.getStringList('favourites') ?? [];
    if (tours.contains(widget.tour.id.toString())) {
        setState(() {
            isFavourite = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Stack(
                children: [
                    AspectRatio(
                        aspectRatio: 3/2, 
                        child: Image.network(
                            'https://meriyan.ru/images/storage/tours/${widget.tour.id}/' + widget.tour.imagePath,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                                if (progress == null) {
                                    return child;
                                }
                                return Center(
                                    child: CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                        value: progress.expectedTotalBytes != null
                                            ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                                            : null,
                                    ),
                                );
                            }
                        ),
                    ),

                    Positioned(
                        child: GestureDetector(
                            child: isFavourite ? const Icon(
                                Icons.favorite, 
                                color: Colors.white, 
                                size: 36
                            ) : const Icon(
                                Icons.favorite_outline, 
                                color: Colors.white, 
                                size: 36
                            ),
                            onTap: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                if (!isFavourite) {
                                    List<String> tours = prefs.getStringList('favourites') ?? [];
                                    tours.add(widget.tour.id.toString());
                                    await prefs.setStringList('favourites', tours);
                                    //log(tours.toString());
                                    setState(() {
                                        isFavourite = true;
                                    });
                                } else {
                                    List<String> tours = prefs.getStringList('favourites') ?? [];
                                    tours.remove(widget.tour.id.toString());
                                    await prefs.setStringList('favourites', tours);
                                    //log(tours.toString());
                                    setState(() {
                                        isFavourite = false;
                                    });
                                }
                            },
                        ),
                        top: 16, 
                        right: 16
                    )

                ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Text(
                widget.tour.title,
                style: Theme.of(context).textTheme.headline2,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text(
                widget.tour.text,
                style: Theme.of(context).textTheme.bodyText1,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                    color: Theme.of(context).primaryColor,
                    child: const Text("Поехали"), 
                    onPressed: () => showBottomSheet(
                        context: context,
                        builder: (context) => const TourForm()
                        )
                ),
                Text(
                    widget.tour.price.toString() + ' ₽',
                    style: Theme.of(context).textTheme.headline3,
                )
              ]
            )
        ],
      )
    );
  }
}