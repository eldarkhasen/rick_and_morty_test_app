import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/system/bloc/characters_cubit.dart';
import 'package:rick_and_morty_app/system/ui/pages/home_page.dart';

import 'init_services.dart';
final GetIt locatorService = GetIt.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersCubit>(
          create: (context) => locatorService<CharactersCubit>()..loadCharacters(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Rick And Morty app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}


