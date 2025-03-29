import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AiItemBuilder(
    var screenWidth,
    String imagePath,
    String title,
    String ingredients,
    String time,
    var onPressFav,
    var icon,
    )
{
  return Container(
    width: double.infinity,
    height: screenWidth * 0.6,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          // spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.all(screenWidth*0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: double.infinity,
                  height: screenWidth * 0.33,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              IconButton(
                  onPressed: onPressFav,
                  icon: icon)
            ],
          ),
          const SizedBox(height: 4,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    ingredients,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0XFF8A8A8A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: screenWidth*0.02,),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0XFF001A3F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              SizedBox(height: screenWidth * 0.02,),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}