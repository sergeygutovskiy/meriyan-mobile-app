import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meriyan/classes/tour.dart';

class TourCard extends StatelessWidget {
  const TourCard({ Key? key, required this.tour }) : super(key: key);

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            AspectRatio(
                aspectRatio: 3/2, 
                child: Image.network(
                    'https://meriyan.ru/images/storage/tours/${tour.id}/' + tour.imagePath,
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Text(
                tour.title,
                style: Theme.of(context).textTheme.headline2,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text(
                tour.text,
                style: Theme.of(context).textTheme.bodyText1,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                    color: Theme.of(context).primaryColor,
                    child: Text("Поехали"), 
                    onPressed: () => null
                ),
                Text(
                    tour.price.toString() + ' ₽',
                    style: Theme.of(context).textTheme.headline3,
                )
              ]
            )
        ],
      )
    );
  }
}