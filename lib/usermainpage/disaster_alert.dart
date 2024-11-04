// usermainpage/disaster_alert.dart
import 'package:flutter/material.dart';

import '../widgets/news_card.dart';

class DisasterAlert extends StatelessWidget {
  const DisasterAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Alert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            NewsCard(
              imageUrl: "https://www.researchgate.net/publication/353052933/figure/fig3/AS:1043072238489602@1625699209583/Subcategories-of-Fire-Disaster_Q320.jpg",
              title: 'Fire Alert',
              description: 'Fire Alert ! Please take immediate safety precautions.',
              location: 'Chennai',
            ),
            SizedBox(height: 20,),
            NewsCard(
              imageUrl: "https://cdn.pixabay.com/photo/2023/05/31/15/54/ai-generated-8031747_640.jpg",
              title: 'Tsunami',
              description: 'Tsunami Please take immediate safety precautions.',
              location: 'Fort Kochi',
            ),
            SizedBox(height: 20,),
            NewsCard(
              imageUrl: "https://storage.googleapis.com/macrovector-acl-eu/previews/122236/thumb_122236.webp",
              title: 'Medical Emergency',
              description: 'Medical Emergency ! Please take immediate safety precautions.',
              location: 'trissur',
            ),
            SizedBox(height: 20,),
            NewsCard(
              imageUrl: "https://images.hindustantimes.com/Images/Popup/2013/4/19_04_13-metro4.jpg",
              title: 'Earthquake Detected',
              description: 'Earthquake Detected! Please take immediate safety precautions.',
              location: 'Kozhikode',
            ),
          ],
        ),
      )
    );
  }
}