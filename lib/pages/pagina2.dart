import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/usuario/usuario_bloc.dart';
import 'package:flutterbloc/models/usuario.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Acciones de Usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text(
                'Implementar Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                    nombre: "Alejandro San Juan Cieza",
                    edad: 27,
                    profesiones: ["Informático"]);
                usuarioBloc.add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(CambiarEdad(64));
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesiones',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AgregarProfesion("Nueva Profesión"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
