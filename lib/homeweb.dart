import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safariweb/admin/add/constant.dart';
import 'package:safariweb/login/presentation/login.dart';


class Web extends StatelessWidget {
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://t3.ftcdn.net/jpg/02/02/97/20/360_F_202972056_pes9K0KIvfjKfi3mqmxF6GlnSwaGfivL.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // CustomAppBar(),
            Spacer(),
            bottom(),
          ],
        ),

      ),

    );
  }
}
class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
     

    );

  }}

class bottom extends StatelessWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90,bottom:300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: MaterialButton(
            onPressed: () {

              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>(myLogin()),
                ),
              );


            },

            child: FittedBox(

              // Now it just take the required spaces
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF372930),
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF372930),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Get Started".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),
          ),

          ),
        ],
      ),
    );
  }
}
