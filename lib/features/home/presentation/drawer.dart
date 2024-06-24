import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourism_app/features/home/presentation/transport/transport.dart';
import 'package:tourism_app/features/svscreen/TourismType.dart';
import 'package:tourism_app/features/svscreen/aboutus.dart';
import 'package:tourism_app/features/svscreen/logup.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331,
      child: Drawer(
        backgroundColor: Color(0xff6C3428),
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 16),
          child: ListView(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TourismType()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Tourism Type',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffE4D1B9)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Transprant()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Transportation',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffE4D1B9)),
                  ),
                ),
              ),
            ),
            Text(
              'hotels',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffE4D1B9)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'share with',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffE4D1B9)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aboutus()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'about us',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffE4D1B9)),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
