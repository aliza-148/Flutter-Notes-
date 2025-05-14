import 'package:flutter/material.dart';

ListTile buildDrawerItem(
  IconData icon,
  String title,
  BuildContext context,
  VoidCallback onTap,
) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(title),
    onTap: onTap,
  );
}

Widget buildContainer(int index, {bool isHorizontal = false}) {
  List<String> localImages = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];
  List<String> networkImages = [
    'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
    'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
    'https://thumbs.dreamstime.com/b/young-conceptual-image-large-stone-shape-human-brain-conceptual-image-large-stone-shape-110748113.jpg',
  ];

  Widget imageWidget =
      index < 3
          ? Image.asset(
            localImages[index],
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          )
          : Image.network(
            networkImages[index - 3],
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          );

  return Container(
    width:
        isHorizontal
            ? 200
            : double.infinity, // Increased width for horizontal scrolling
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageWidget,
        SizedBox(height: 10),
        Text(
          'Sheeza',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
