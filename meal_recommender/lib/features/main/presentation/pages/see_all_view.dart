/*import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';
import '../widgets/recommened.dart';
import '../widgets/trending.dart';

class SeeAllScreen extends StatelessWidget {
   SeeAllScreen({super.key});

  final List<Map<String, dynamic>> trendingItems = [
    {'image': 'assets/images/shawrma.jpg', 'title': 'Shawarma', 'ingredients': '10 ingredients', 'time': '14 min'},
    {'image': 'assets/images/shawrma.jpg', 'title': 'Shawarma', 'ingredients': '10 ingredients', 'time': '14 min'},
    {'image': 'assets/images/shawrma.jpg', 'title': 'Shawarma', 'ingredients': '10 ingredients', 'time': '14 min'},
    {'image': 'assets/images/shawrma.jpg', 'title': 'Shawarma', 'ingredients': '10 ingredients', 'time': '14 min'},
  ];

   final List<Map<String, dynamic>> recommenedItems = [
     {'image': 'assets/images/burger.jpg', 'title': 'Original Burger', 'ingredients': '10 ingredients', 'time': '14 min'},
     {'image': 'assets/images/burger.jpg', 'title': 'Original Burger', 'ingredients': '10 ingredients', 'time': '14 min'},
     {'image': 'assets/images/burger.jpg', 'title': 'Original Burger', 'ingredients': '10 ingredients', 'time': '14 min'},
     {'image': 'assets/images/burger.jpg', 'title': 'Original Burger', 'ingredients': '10 ingredients', 'time': '14 min'},
   ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_sharp,
              color: BaseColorPalette.mainColor,
              size: screenWidth * 0.07
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.notifications,
                color: BaseColorPalette.mainColor,
                size: screenWidth * 0.07
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Trending Recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: screenWidth * 0.05,),
            SizedBox(
              height: screenWidth * 0.45,
              child: ListView.builder(
                itemCount: trendingItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.03),
                    child: TrendingItemBuilder(
                      screenWidth,
                      trendingItems[index]['image'],
                      trendingItems[index]['title'],
                      trendingItems[index]['ingredients'],
                      trendingItems[index]['time'],
                    ),
                  );
                },

              ),
            ),
            SizedBox(height: screenWidth * 0.05,),
            const Text(
              'Recommended For You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: screenWidth*0.05,),
            Expanded(
              child: ListView.separated(
                itemCount: recommenedItems.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context,index)=>SizedBox(height: screenWidth*0.03,),
                itemBuilder: (context, index) {
                  return RecommendedItemBuilder(
                    screenWidth,
                    recommenedItems[index]['image'],
                    recommenedItems[index]['title'],
                    recommenedItems[index]['ingredients'],
                    recommenedItems[index]['time'],
                          (){}  // ON PRESS FAVOURITE FUNCTION
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}*/