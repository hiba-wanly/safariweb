import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/admin/add/add_page_off.dart';
import 'package:safariweb/admin/register/bloc/erg_states.dart';
import 'package:safariweb/admin/register/bloc/reg_cubit.dart';
import 'package:safariweb/admin/register/presentation/register_screen.dart';
import 'package:safariweb/admin/remove/removePage.dart';
import 'package:safariweb/homeweb.dart';

class MuPage extends StatefulWidget {
  const MuPage({Key? key}) : super(key: key);

  @override
  State<MuPage> createState() => _MuPageState();
}

class _MuPageState extends State<MuPage> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
           children: [
             Center(
               child: Container(
                 child: Text(
                   "my Page",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 30,
                   ),
                 ),
               ),
             ),
             SizedBox(height: 15,),
             Text(
               'Admin',
             ),
           ],
        ),
      ),
        floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be Alignment.center
          alignment: Alignment.bottomRight,
          ringColor: Colors.white.withAlpha(100),
          ringDiameter: 300.0,
          ringWidth: 30.0,
          fabSize: 65.0,
          fabElevation: 10.0,
          fabIconBorder: CircleBorder(),
          fabColor: Colors.white,
          fabOpenIcon: Icon(Icons.menu_sharp, color: Color(0xffef9b0f)),
          fabCloseIcon: Icon(Icons.close, color: Color(0xffffd800)),
          fabMargin: const EdgeInsets.all(20.0),
          animationDuration: const Duration(milliseconds: 10),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
             

                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>RemovePage(),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.drive_file_rename_outline_rounded, color: Color(0xffffbf00),size: 30,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>BlocProvider(create:(BuildContext context)=>RegisterCubit(initialState()),child: Register()),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.man, color: Color(0xffffbf00),size: 30,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AddPageOffice(),
                  ),
                );

              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.add, color: Color(0xffffbf00),size: 30,),
            ),

          ],
        ),
      ),
    
    );
  }
}