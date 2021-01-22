import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/usuario/usuario_bloc.dart';
import 'package:flutterbloc/pages/pagina1.dart';
import 'package:flutterbloc/pages/pagina2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => new UsuarioBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1(),
          'pagina2': (_) => Pagina2(),
        },
      ),
    );
  }
}
