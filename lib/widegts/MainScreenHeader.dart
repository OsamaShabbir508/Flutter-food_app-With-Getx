import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What Would You Like ',
                  style: GoogleFonts.oswald(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'To eat ?',
                  style: GoogleFonts.oswald(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(
              Icons.notifications_none,
              color: Colors.blue,
              size: 30,
            )
          ],
        ));
  }
}
