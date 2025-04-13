import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TrendingItemBuilder(
    var screenHeight,
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

        child: CachedNetworkImage(
          imageUrl: imagePath,
          width: screenWidth * 0.6,
          height: screenWidth * 0.3,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
      ),
      SizedBox(height: screenWidth * 0.015,),
      Text(
        title.length > 15 ? "${title.substring(0, 15)}..." : title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          Text(
            ingredients,
            style: TextStyle(
              fontSize: 12,
              color: Color(0XFF8A8A8A),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: screenWidth*0.02,),
          Text(
            time,
            style: TextStyle(
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