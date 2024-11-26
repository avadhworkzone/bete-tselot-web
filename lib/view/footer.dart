import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            '© 2024 Bete Tselot',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.white),
                onPressed: () => print('Facebook clicked'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
