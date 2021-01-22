import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/usuario/usuario_bloc.dart';
import 'package:flutterbloc/models/usuario.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Usuario'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario());
              })
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.exiteUsuario) {
            return InformacionUsuario(state.usuario);
          } else {
            return Center(
              child: Text('No existe el usuario'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre: ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            Divider(),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...usuario.profesiones
                .map((profesion) => ListTile(title: Text(profesion)))
                .toList()
            // ListTile(
            //   title: Text('Profesion 1'),
            // ),
            // ListTile(
            //   title: Text('Profesion 2'),
            // ),
            // ListTile(
            //   title: Text('Profesion 3'),
            // ),
          ],
        ));
  }
}
