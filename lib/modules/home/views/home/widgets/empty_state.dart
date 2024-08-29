import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String image;
  final String message;
  const EmptyState({
    super.key,
    required this.image,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 140,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
