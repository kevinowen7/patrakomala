import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:patrakomala_neumorphic/bloc/bloc.dart';
import 'package:patrakomala_neumorphic/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc()..add(FetchProduct()),
        ),
        BlocProvider(
          create: (_) => SubsectorBloc()..add(FetchSubsector()),
        ),
        BlocProvider(
          create: (_) => BisnisBloc(),
        ),
        BlocProvider(
          create: (_) => BeltBloc()..add(FetchBelt()),
        ),
      ],
      child: GetMaterialApp(
        home: TesPage(),
      ),
    );
  }
}
