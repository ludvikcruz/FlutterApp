import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure the correct import statement is used for SVGs

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Correct usage of constructor for passing key
AppBar buildAppBar(BuildContext context){
  return AppBar(
        title: Text(
          'Breakfast',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Add logic for what should happen when the icon is tapped. For example:
            Navigator.pop(context); // Go back to the previous screen
          },
          child: Container(
            margin: const EdgeInsets.all(10), // Use const for compile-time constants
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/C.svg', // Use forward slashes for paths
              height: 20, // Adjusted for visibility
              width: 20, // Adjusted for visibility
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8), // Use const for compile-time constants
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Add logic for what should happen when this part of the AppBar is tapped
            },
            child: Padding(
              padding: const EdgeInsets.all(10), // Proper padding for alignment
              child: 
              SvgPicture.asset(
                'assets/icons/D.svg',
                height: 5,
                width: 5,
                ), // Example icon, replace with actual asset path
            ),
          ),
        ],
      );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:Column(
        children: [
         Container(
          margin: EdgeInsets.only(top: 40, left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius:  0.0
              ),
            ],
          ),
        child: 
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
            ),
          ),
         ),
        ],
      ),
      );
      // Consider adding body property here to define the main content of the HomePage
    
  }
}
