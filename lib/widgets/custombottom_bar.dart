// widgets/custombottom_bar.dart
import 'package:disaster_management/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:geolocator/geolocator.dart';
import '../usermainpage/disaster_alert.dart';
import '../usermainpage/homepage.dart';
import '../usermainpage/resource_finder.dart';
import '../usermainpage/saftey_guidlines.dart';
import '../usermainpage/profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied');
      return;
    } else if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print('${position.latitude}, ${position.longitude}');
  }

  int _selectedIndex = 0;
  String _sosMessage = ''; // Variable to hold the SOS message

  final List<Widget> _pages = [
    HomePage(),
    DisasterAlert(),
    ResourceFinder(),
    SafteyGuidlines(),
    Profile(),
  ];

  void _showSosDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Emergency SOS Message',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                'Accessing the Feature: Users can activate the SOS feature by tapping the red SOS button located at the bottom right corner of the app.',
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 30.h),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _sosMessage = value; // Update the SOS message
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your SOS message',
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 1.sw, // 1.sw is equivalent to screen width
                child: ElevatedButton(
                  onPressed: () => getLocation(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 12, 12),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    textStyle: TextStyle(fontSize: 16.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const [
          "Home",
          "Requests",
          "Resources",
          "Safety",
          "Profile",
        ],
        icons: const [
          Icons.home_outlined,
          Icons.request_page,
          Icons.search,
          Icons.shield,
          Icons.person_off,
        ],
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 12.sp, // Responsive font size
        ),
        tabSize: 60.w, // Responsive tab size
        tabIconSize: 28.w, // Responsive icon size
        tabBarColor: const Color.fromARGB(255, 251, 219, 219),
        tabSelectedColor: Colors.red,
        tabIconSelectedSize: 28.w,
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSosDialog, // Show the SOS dialog
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.sos,
          color: Colors.white, // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
