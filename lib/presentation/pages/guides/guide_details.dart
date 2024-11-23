import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nebot/core/theme/app_theme.dart';

class GuideDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                _buildBackgroung(),
                _buildBody(context),
                Positioned(
                  top: 40,
                  left: 16,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon:SvgPicture.asset('assets/arrow/arrow-back.svg'),
                      onPressed: () {
                        print('pip');
                        Navigator.pop(context);

                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
    );


  }
  Widget _buildBackgroung() {
    return Image.asset(
      'assets/roma.jpg',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildBody(context){
    return  Positioned(
      top: 30,
      bottom: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.22),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                padding:  EdgeInsets.only(left: 24.0.w, top: 18.0.h, right: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 1.0.w,right:8.w,top: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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

                              SizedBox(width: 14.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Maria',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      SvgPicture.asset('assets/check_yellow.svg'),
                                      SizedBox(width: 6.w),
                                      SvgPicture.asset('assets/like_red.svg'),
                                    ],
                                  ),
                                  SvgPicture.asset('assets/star.svg'),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    child: Text(
                                      'Dummy text to add about the city you suggest to stay in based',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(width: 20,),
                              SvgPicture.asset('assets/share.svg'),

                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                            '112 FOLLOWERS',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '34 TRIPS',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6.w),

                          OutlinedButton(
                            onPressed: () {
                              // Add your onPressed functionality here
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue, width: 2), // Blue border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // Rounded corners
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h), // Smaller padding
                            ),
                            child: Text(
                              'FOLLOW',
                              style: TextStyle(
                                color: Colors.blue, // Blue text color
                                fontWeight: FontWeight.bold, // Bold text
                                fontSize: 12.sp, // Smaller font size
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CURRENT TRIP |',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Text(
                                ' HISTORY TRIPS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          _buildCard(context) ,

                        ],
                      ),

                      SizedBox(height: 60.h,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(context){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  // Background Image
                  Container(

                    child: ClipRRect(
                      child: Image.asset(
                        'assets/roma.jpg', // Replace with your image asset path
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Content (Text and Icons)
                  Positioned(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Star Rating
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SANTORINI TRIP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Download Button
                  Positioned(
                    bottom: 16.h,
                    right: 16.w,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.download, color: Colors.white, size: 15.sp),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: starColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '12',
                            style: TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text under the photo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Dummy text to add about the city you suggest to stay in based on your research and short description about it.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  // Additional button or text if needed
                  GestureDetector(
                    onTap: () {
                      // Add your onTap functionality here
                    },
                    child: Text(
                      'CHECK NOW',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.r),
            topLeft: Radius.circular(50.r),
          ),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r)),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem('assets/explore.png', 'Explore'),
                _buildNavItem('assets/profile.png', 'My Profile'),
                _buildNavItem('assets/guides.png', 'Guides'),
                _buildNavItem('assets/place.png', 'Places'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 24.w, height: 24.h),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
