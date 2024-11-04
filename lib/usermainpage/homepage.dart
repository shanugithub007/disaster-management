// usermainpage/homepage.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/news_card.dart';
import 'disaster_alert.dart';
import 'payment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r), // Use ScreenUtil for border radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                    child: Image.network(
                      'https://www.pointsoflight.org/wp-content/uploads/2023/07/dreamstime_xxl_70706629-1060x705.jpg',
                      width: double.infinity,
                      height: 100.h, // Use ScreenUtil for height
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Donate Fund',
                          style: TextStyle(
                            fontSize: 20.sp, // Use ScreenUtil for font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h), // Use ScreenUtil for spacing
                        Text(
                          'Your generous donation helps us provide essential resources and services to those in need. Every contribution makes a difference.',
                          style: TextStyle(
                            fontSize: 13.sp, // Use ScreenUtil for font size
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.h), // Use ScreenUtil for spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaymentOpp(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Red background for the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: Text(
                                'Donate Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // White text color for the button
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h), // Use ScreenUtil for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
              "Disaster Alert News",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(onPressed: (){
               Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DisasterAlert()));
            }, child: Text("View More",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            ),
            SizedBox(height: 10.h), // Space between heading and card
            NewsCard(
              imageUrl: "https://images.hindustantimes.com/Images/Popup/2013/4/19_04_13-metro4.jpg",
              title: 'Earthquake Detected',
              description: 'Earthquake Detected! Please take immediate safety precautions.',
              location: 'Kozhikode',
            ),
            SizedBox(height: 20,),
            NewsCard(
              imageUrl: "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-26702,resizemode-75,msid-112589231/news/india/imd-predicts-heavy-rains-in-kerala-issues-orange-alert.jpg",
              title: 'Heavy Rain',
              description: 'Heavy Rain Detected! Please take immediate safety precautions.',
              location: 'Thiruvananthapuram',
            ),
          ],
        ),
      ),
    );
  }
}
