import 'package:flutter/material.dart';

class HazardCard extends StatelessWidget {

  final List<String> hazards;

  const HazardCard({

    super.key,

    required this.hazards,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Detected Hazards",

              style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 15),

            ...hazards.map(

              (e){

                return ListTile(

                  leading: const Icon(
                    Icons.warning,
                    color: Colors.orange,
                  ),

                  title: Text(e),

                );

              },

            ),

          ],

        ),

      ),

    );

  }

}