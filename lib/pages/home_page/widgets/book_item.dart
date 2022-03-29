import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:math' as math;

class BookItem extends StatelessWidget {
  const BookItem({
    required this.name,
    required this.date,
    required this.assetName,
    required this.offset,
    Key? key,
  }) : super(key: key);
  final String name;
  final String date;
  final String assetName;
  final double offset;

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) /
        0.08)); //<--caluclate Gaussian function

    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Transform.translate(
        offset: Offset(-32 * gauss * offset.sign, 0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              child: Image.asset(
                assetName,
                fit: BoxFit.none,
                height: Get.height * 0.4,
                width: double.infinity,
                alignment: Alignment(-offset.abs(), 0), //<-- Set the alignment
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: CardContent(
              name: name,
              date: date,
              offset: offset,
            ))
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent({
    Key? key,
    required this.name,
    required this.date,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
              offset: Offset(8 * offset, 0),
              child: Text(name, style: const TextStyle(fontSize: 20))),
          const SizedBox(height: 8),
          Text(date, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
