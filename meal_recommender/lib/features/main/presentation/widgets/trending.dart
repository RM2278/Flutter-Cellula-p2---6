import 'package:flutter/cupertino.dart';

Widget TrendingItemBuilder(
    var screenWidth,
    String imagePath,
    String title,
    String ingredients,
    String time,)
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          height: screenWidth * 0.3,
          width: screenWidth * 0.6,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: screenWidth * 0.015,),
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          Text(
            ingredients,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0XFF8A8A8A),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: screenWidth*0.02,),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0XFF001A3F),
              fontWeight: FontWeight.w500,
            ),
          ),

        ],
      ),
    ],
  );
}