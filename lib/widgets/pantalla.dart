import 'package:agenda/dominio/clases.dart';
import 'package:agenda/repositorio/nose.dart';
import 'package:agenda/widgets/calendario.dart';
import 'package:agenda/widgets/lista.dart';
import 'package:flutter/material.dart';

Future<void> Agregar_turno(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  final pacienteController = TextEditingController();
  final profesionalController = TextEditingController();
  // final servicioController = TextEditingController();
  final fechaController = TextEditingController();

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Agregar Turno'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: pacienteController,
                decoration: InputDecoration(labelText: 'ID del Paciente'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el ID del paciente';
                  }
                  // Agregar validaciones adicionales si es necesario
                  return null;
                },
              ),
              // Campos similares para profesional, servicio y fecha
              TextFormField(
                controller: profesionalController,
                decoration: InputDecoration(labelText: 'ID del Profesional'),
                // ...
              ),
              // ...
              TextFormField(
                controller: fechaController,
                decoration: InputDecoration(labelText: 'Fecha'),
                // ...
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Obtener los datos ingresados
                final pacienteId = int.parse(pacienteController.text);
                final profesionalId = int.parse(profesionalController.text);
                // ...

                // Llamar a la función para agregar el turno
                turnos.add(Turno(
                    id: turnos.length + 1,
                    pacienteId: pacienteId,
                    profesionalId: profesionalId,
                    fecha: DateTime(2024),
                    state: Estado.agendado));

                Navigator.pop(context);
              }
            },
            child: Text('Guardar'),
          ),
        ],
      );
    },
  );
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 625, maxWidth: 1200),
              child: const Lista(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 300, maxWidth: 550),
                    child: const CalendarScreen(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: Center(
                        child: ElevatedButton(
                            onPressed: () => Agregar_turno(context),
                            child: const Text("Agregar turno"))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
