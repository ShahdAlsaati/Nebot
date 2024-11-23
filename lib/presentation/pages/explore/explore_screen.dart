import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nebot/core/theme/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              _buildHeader(),
              SizedBox(height: 16.h),
              _buildUserInfo(),
              SizedBox(height: 16.h),
              _buildMapSection(context),
              SizedBox(height: 16.h),
              _buildTripSection(),
              SizedBox(height: 16.h),
              _buildStepsList(),
              SizedBox(height: 45.h),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPLORE',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search for people and places',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
      width: 70.0,
      height: 70.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,  // Ensures it's circular
            border: Border.all(
              color: primaryColor,  // Set border color
              width: 4.0,  // Set border width
            ),
          ),
          child: Container(
            width: 70.0,  // Adjust size as needed
            height: 70.0, // Adjust size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,  // Ensures it's circular
              border: Border.all(
                //
                color: Colors.transparent, // Set border color
                width: 2.0,  // Set border width
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpKWsnzQxUNHWQZ7e6bbHgZEr5g-JhWRUPhw&s'),
              backgroundColor: primaryColor,
            ),
          )

        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maria',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Dummy text to add about the city you suggest to stay in based',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('112 FOLLOWERS', style: TextStyle(color: Colors.blue)),
                  SizedBox(width: 16),
                  Text('34 TRIPS', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection(context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.23,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PsonROgbBHCaPJV3tGH4MW31gcBrt3F90w&s',
          fit:BoxFit.fitWidth,),
      ),
    );
  }

  Widget _buildTripSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SANTORINI TRIP',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SvgPicture.asset('assets/star.svg'),
        SizedBox(height: 8),
        Text(
          'Dummy text to add about the city you suggest to stay in based on your research and short description about it.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 8),

        Container(
          decoration:BoxDecoration(
            border: Border.all(color: Colors.grey.shade100, width: 1), // Blue border

          ),
        )
      ],
    );
  }

  Widget _buildStepsList() {
    return Column(
      children: List.generate(3, (index) => _buildStepItem(index + 1)),
    );
  }


  Widget _buildStepItem(int stepNumber){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Icon and distance
          Column(
            children: [
              SvgPicture.asset('assets/explore/Icon_location.svg'),

              SizedBox(height: 4),
              Text(
                '10 km',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              // Dotted line
              Container(
                width: 1,
                height: 80,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stop label and Restaurant name
                Text(
                  '${stepNumber}st Stop',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [

                    Text(
                      'Place Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6.w),
                    SvgPicture.asset('assets/check_yellow.svg'),
                    SizedBox(width: 6.w),
                    SvgPicture.asset('assets/like_red.svg'),
                  ],
                ),

                SizedBox(height: 4),

                // Rating stars and icons
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                  ),
                ),
                SizedBox(height: 12),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Other code remains the same

                    // Horizontal scrolling section for the image placeholders
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                                (index) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
