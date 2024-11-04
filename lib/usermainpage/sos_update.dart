// usermainpage/sos_update.dart
import 'package:flutter/material.dart';
import '../widgets/textfiled.dart';

class SosUpdatePage extends StatelessWidget {
  const SosUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SOS Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update SOS Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please update your emergency contact details below:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextFiledWidget(
              labelText: 'Enter your email',
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFiledWidget(
              labelText: 'Enter your second email',
              obscureText: false,
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => PaymentOpp(),
                //   ),
                // );
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
                    'Update',
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
    );
  }
}
