import 'package:bloc_tutorial/bloc/switch/switch_example_bloc.dart';
import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:bloc_tutorial/ui/switch_slider_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await HomeWidget.registerBackgroundCallback(
//     name: 'HomeWidgetExample',
//     callback: interactiveCallback,
//   );
//   runApp(const MyHomeWidgetApp());
// }
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
        ],
        child: MaterialApp(
          // ye ek tarika ha routes ko define karna
          routes: {
            CounterScreen.routeName: (_) => const CounterScreen(),
            SwitchSliderScreen.routeName: (_) => const SwitchSliderScreen(),
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

class Event {}

class MyHomeWidgetApp extends StatelessWidget {
  const MyHomeWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Widget Example'),
        ),
        body: const Center(
          child: Text('Main Screen Content'),
        ),
      ),
    );
  }
}

class HomeWidgetExample extends StatelessWidget {
  const HomeWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello Home Widget!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
