import 'package:bloc_tutorial/bloc/switch/switch_example_bloc.dart';
import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:bloc_tutorial/ui/image_picker.dart';
import 'package:bloc_tutorial/ui/switch_slider_screen.dart';
import 'package:bloc_tutorial/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/drop_down/drop_down_bloc.dart';
import 'bloc/image_picker/image_picker_bloc.dart';
import 'bloc/radio_checkBox_buttons/radio_check_box_buttons_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // using MultiBlocProvider
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchExampleBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => DropDownBloc()),
          BlocProvider(create: (_) => RadioCheckBoxButtonsBloc()),
        ],
        child: MaterialApp(
          // ye ek tarika ha routes ko define karna
          routes: {
            // MyHomePage.routeName: (_) => MyHomePage(),
            CounterScreen.routeName: (_) => const CounterScreen(),
            SwitchSliderScreen.routeName: (_) => const SwitchSliderScreen(),
            ImagePickerScreen.routeName: (_) => const ImagePickerScreen(),
          },
          title: 'Business logic component',
          theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.deepPurple,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime)),
          initialRoute: CounterScreen.routeName,
          // home: const CounterScreen(),
          // home: Scaffold(
          //   floatingActionButton: FloatingActionButton(
          //     onPressed: () {
          //       // Equality concept in Dart using Bloc
          //
          //       // here we see the concept of equality in dart
          //       // In dart an object is only equal to its self by default
          //       // so this is because their HashCode is different from each other
          //
          //       Employee e1 = Employee(name: 'Hamza', id: 1);
          //       Employee e2 = Employee(name: 'Hamza', id: 1);
          //
          //       if (kDebugMode) {
          //         print(e1 == e2); //false
          //         print(e1 == e1); //true
          //         // without using Equatable pkg
          //         print(e1.hashCode.toString()); //hashcode 70833971
          //         print(e2.hashCode.toString()); //hashcode 527616837
          //
          //         // with equatable pkg
          //         print(e1 == e2); //true
          //         print(e1.hashCode.toString()); //hashcode 357489301
          //         print(e2.hashCode.toString()); //hashcode 357489301
          //       }
          //     },
          //   ),
          // ),
        ));

    // using single BlocProvider

    // return BlocProvider(
    //   create: (_) => CounterBloc(),
    //   child: BlocProvider(
    //     create: (_) => SwitchExampleBloc(),
    //     child: MaterialApp(),
    //   ),
    // );
  }
}

// ignore: must_be_immutable
class Employee extends Equatable {
  String name;
  int id;
  Employee({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];

// Agr hum chaty hain k hamry is class k sary object equal ho agr os ke value same ho tu hamy ye nechy code likhna paryga
//ye tu ek simple class ha jis k liya hum na easy kr liya lakin jab hamary pas complex class ho or k liya ye karengy tu its quite difficult
// tu hum is liya is k liya Equatable Package use kart hain, to compare their objects

  // @override
  // bool operator ==(Object other){
  //   return identical (this, other) ||
  //       other is Employee &&
  //           runtimeType == other.runtime Type && name == other.name && id == other.id;
  // }
  // @override
  // int get hashCode => name.hashCode ^ id.hashCode;
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = '';

  @override
  void initState() {
    super.initState();
    // _loadData();
  }
  //
  // Future<void> _loadData() async {
  //   title = await HomeWidget.getWidgetData('title') ?? '';
  //   setState(() {});
  // }
  //
  // Future<void> _update() async {
  //   await HomeWidget.saveWidgetData('title', 'Updated!');
  //   await HomeWidget.updateWidget(name: 'HomeWidgetExample');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.lightBlueAccent,
          flexibleSpace: ClipPath(
            clipper: ClipExample(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: const Center(
                  child: Text(
                "GeeksforGeeks",
                style: TextStyle(fontSize: 40, color: Colors.white),
              )),
            ),
          ),
        ),
        body: Center(child: Text(title)));
  }
}

class ClipExample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
