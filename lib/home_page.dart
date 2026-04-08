import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
        ],
      ),
    );
  }

  buildContainer() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.network(
              'https://afar.brightspotcdn.com/dims4/default/5e0f8f5/2147483647/strip/true/crop/5760x3056+0+0/resize/1440x764!/quality/90/?url=https%3A%2F%2Fk3-prod-afar-media.s3.us-west-2.amazonaws.com%2Fbrightspot%2F0e%2Fe0%2F2d5cbb2139b753c565850eda5611%2Foriginal-amsterdam-the-netherlands-canals-copy.jpg',
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harligen, Netherlands',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(children: [Icon(Icons.star, size: 18), Text('4.76')]),
            ],
          ),
          Text('Professional Host'),
          Text('18-23 Dec'),
          Text('\$1,065 total'),
        ],
      ),
    );
  }
}