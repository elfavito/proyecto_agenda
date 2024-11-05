import 'package:agenda/repositorio/nose.dart';
import 'package:flutter/material.dart';

enum Estado { agendado, confirmado, cancelado }

class Turno {
  final int id;
  final int pacienteId;
  final int profesionalId;
  // final int servicioId;
  final DateTime fecha;
  final Estado state;

  Turno(
      {required this.id,
      required this.pacienteId,
      required this.profesionalId,
      // required this.servicioId,
      required this.fecha,
      required this.state});



}

class Secretaria {
  final int id;
  final String nombre;
  final String apellido;
  final String usuario;
  final String contrasena;

  Secretaria(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.usuario,
      required this.contrasena});
}

class Paciente {
  final int id;
  final String nombre;
  final String apellido;
  final int telefono;
  final List<String> doctores;

  Paciente({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.doctores,
  });
}

class Profesional {
  final int id;
  final String nombre;
  final String apellido;
  final String especialidad;
  final List<Horario> horarios;

  Profesional({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.especialidad,
    required this.horarios,
  });
}

class Horario {
  final DateTime dia;
  final TimeOfDay horaInicio;
  final TimeOfDay horaFin;

  Horario({
    required this.dia,
    required this.horaInicio,
    required this.horaFin,
  });
}

class Servicio {
  final int id;
  final String nombre;
  final String descripcion;
  final Duration duracion;
  final double costo;

  Servicio({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.duracion,
    required this.costo,
  });

  double ganancia() {
    return costo * 0.30;
  }
}
