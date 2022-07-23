import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/hotel/bloc/hotel_cubit.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';
import 'package:safariweb/hotel/presentation/add_room.dart';
import 'package:safariweb/hotel/presentation/edit_room.dart';
import 'package:safariweb/hotel/presentation/remove_room.dart';


class HoltePage extends StatefulWidget {
  const HoltePage({Key? key}) : super(key: key);

  @override
  State<HoltePage> createState() => _HoltePageState();
}

class _HoltePageState extends State<HoltePage> {

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
           children: [
             Container(
                      //width: 256,
                      height: 275,
                      // height: height!* .6,
                      //width:width!*90 ,

                      decoration: const BoxDecoration(

                        //borderRadius: BorderRadius.circular(5),
                        color: Colors.white,shape:BoxShape.rectangle,
                        image:  DecorationImage(

                          image: AssetImage("images/hotel.jpg",),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child:
    BlocProvider(
      create: (BuildContext context) => HotelCubit(HotelInitState()), 
      child: BlocConsumer<HotelCubit,HotelState>(
        listener: (context, state){
          if(state is HotelLoadingSuccessState){
          }
          if (state is HotelLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is HotelLoading){
              return Center(
                    child: CircularProgressIndicator(),
                  );
          }
          else
    return 
            Column(
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
               'Hotel',
             ),
              ],
            );
        }
           
        ),
      ),
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
                  MaterialPageRoute(builder: (context)=>RemoveRoom(),
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
                  MaterialPageRoute(builder: (context)=>EditRoom(),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.edit, color: Color(0xffffbf00),size: 30,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AddRoom(),
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