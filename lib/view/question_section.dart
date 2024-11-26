import 'package:flutter/material.dart';

class QuotesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            '"For where two or three gather in my name, there am I with them." - Matthew 18:20',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
