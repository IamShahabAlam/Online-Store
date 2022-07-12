import 'package:flutter/material.dart';

import 'constants.dart';

class AppbarLead extends StatelessWidget {

 AppbarLead({this.icon, this.page, this.color });

 final IconData icon;
 final Widget page;
 final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
          // (){Navigator.push(context, MaterialPageRoute(builder: (context) => page ));},
      child: Icon(icon, color: color,),
    );
  }
}

// =====================================================================


class BottomButton extends StatelessWidget {

  BottomButton({this.buttonTitle,this.onTap, this.color, this.t_margin});

  final Function onTap;
  final String buttonTitle;
  final Color color;
  final double t_margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
             topRight: Radius.circular(20),
             topLeft: Radius.circular(20)
            )
        ),
        child: Center(child: Text(buttonTitle, )),
        margin: EdgeInsets.only(top: t_margin),
        // height: ,
        width: double.infinity,
        
      ),
    );
  }
}

// =====================================================================


class HomeBtn extends StatelessWidget {
  const HomeBtn({ this.t_margin, this.name , this.onpressed, this.firstClr, this.lastClr,this.heightB,this.widthB});

  final double  t_margin, heightB ,widthB ;
  final String name ;
  final Function onpressed ;
  final Color firstClr, lastClr;

  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: _h*t_margin),
      height: _h*heightB,
      width: _w*widthB,
      decoration: BoxDecoration(
        boxShadow: [ kBtnBoxShadow],

        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            begin: Alignment.centerLeft , end: Alignment.centerRight ,
            colors: [firstClr, lastClr, ]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30)),
          enableFeedback: false,
          // side: BorderSide(),
          // elevation: 12,
          // animationDuration: Duration(seconds: 5),
          // tapTargetSize: MaterialTapTargetSize.,
          textStyle: TextStyle( fontSize: 17.0, fontWeight: FontWeight.bold ),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onpressed ,
            // (){ Navigator.push(context, MaterialPageRoute(builder: (context) => screen ));},
        child: Text(name), ),
    );
  }
}
