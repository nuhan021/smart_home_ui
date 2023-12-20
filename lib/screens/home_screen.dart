import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/components/smart_device_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List smartDevices = [
    {
      'smartDeviceName': 'Smart Light',
      'iconPath': 'assets/icons/light-bulb.png',
      'powerStatus': false
    },
    {
      'smartDeviceName': 'Smart AC',
      'iconPath': 'assets/icons/air-conditioner.png',
      'powerStatus': false
    },
    {
      'smartDeviceName': 'Smart TV',
      'iconPath': 'assets/icons/smart-tv.png',
      'powerStatus': false
    },
    {
      'smartDeviceName': 'Smart Fan',
      'iconPath': 'assets/icons/fan.png',
      'powerStatus': false
    },
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartDevices[index]['powerStatus'] = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    'Nuhan Ali',
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25,),
            // divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 25),

            // smart device grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800
                ),
              ),
            ),
            const SizedBox(height: 10),


            // grid
            Expanded(
              child: GridView.builder(
                itemCount: smartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: smartDevices[index]['smartDeviceName'],
                    iconPath: smartDevices[index]['iconPath'],
                    powerOn: smartDevices[index]['powerStatus'],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
