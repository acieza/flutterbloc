part of 'usuario_bloc.dart';

class UsuarioState {
  final bool exiteUsuario;
  final Usuario usuario;

  UsuarioState({Usuario user})
      : usuario = user ?? null,
        exiteUsuario = (user != null) ? true : false;

  UsuarioState copyWith({Usuario usuario}) => UsuarioState(
        user: usuario ?? this.usuario,
      );

  UsuarioState estadoInicial() => new UsuarioState();
}
