import 'package:flutter/material.dart';
import 'package:meriyan/classes/tour.dart';
import 'package:meriyan/components/tour_card.dart';

class TourList extends StatelessWidget {
  const TourList({ Key? key, required this.tours }) : super(key: key);

  final List<Tour> tours;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: tours.map((e) => TourCard(tour: e)).toList(),
    );
  }
}