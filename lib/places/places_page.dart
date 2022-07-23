import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/places/bloc/places_cubit.dart';
import 'package:safariweb/places/bloc/places_states.dart';
import 'package:safariweb/places/presentation/add_places_page.dart';
import 'package:safariweb/restaurant/bloc/rest_cubit.dart';
import 'package:safariweb/restaurant/bloc/rest_states.dart';
import 'package:safariweb/restaurant/presentation/add_rest_page.dart';
import 'package:safariweb/restaurant/presentation/remove_rest_page.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
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

                          image: AssetImage("images/place1.jpg",),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child:
     BlocProvider(
      create: (BuildContext context) => PlacesCubit(PlacesInitState()), 
      child: BlocConsumer<PlacesCubit,PlacesState>(
        listener: (context, state){
          if(state is PlacesLoadingSuccessState){
          }
          if (state is PlacesLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is PlacesLoading){
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
               'Places',
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
                  MaterialPageRoute(builder: (context)=>AddPlaces(),
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
                  MaterialPageRoute(builder: (context)=>AddPlaces(),
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
                  MaterialPageRoute(builder: (context)=>AddPlaces(),
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