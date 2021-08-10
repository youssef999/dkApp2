import 'package:flutter/material.dart';
class BannerAdds extends StatelessWidget {
  BannerAdds({ key, this.fts}) ;

//   @override
//   _BannerAddsState createState() => _BannerAddsState();
// }
//
// class _BannerAddsState extends State<BannerAdds> {
  final double fts;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return    Container(
      width: _width,
      height: _height / 13,
      child: Center(
          child: Text(
            "Banner Ads",
            style: TextStyle(
              color: Colors.white,
              fontSize: fts,
            ),
          )),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffA903F8),
            Color(0xffF805A5).withOpacity(0.29),
          ],
        ),
      ),
    );
  }
}
