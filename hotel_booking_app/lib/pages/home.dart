import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/pages/fragments/favorite.dart';
import 'package:hotel_booking_app/pages/fragments/home.dart';
import 'package:hotel_booking_app/pages/fragments/schedule.dart';
import 'package:hotel_booking_app/pages/fragments/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex){
      case 0:
        page = Home();
        break;
      case 1:
        page = Schedule();
        break;
      case 2:
        page = Favorite();
        break;
      case 3:
        page = User();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            'Hotelbooking',
            style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        ),
        ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/home-2.svg'), label: 'Home'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/calendar.svg'), label: 'Schedule'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/heart.svg'), label: 'Favorite'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/profile.svg'), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}