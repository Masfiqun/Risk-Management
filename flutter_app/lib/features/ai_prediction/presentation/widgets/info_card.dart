import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

  final String title;

  final String value;

  final IconData icon;

  const InfoCard({

    super.key,

    required this.title,

    required this.value,

    required this.icon,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Row(

          children: [

            Icon(
              icon,
              size: 34,
            ),

            const SizedBox(width: 15),

            Expanded(

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(title),

                  Text(

                    value,

                    style: const TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 18,

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

}