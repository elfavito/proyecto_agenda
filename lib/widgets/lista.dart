import 'package:agenda/repositorio/nose.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  // Lista para almacenar el estado de expansión de cada elemento
  final List<bool> _isExpanded = List.generate(turnos.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: turnos.length,
      itemBuilder: (BuildContext context, int index) {
        final variable = turnos[index];
        return ExpansionTile(
          title: Text('Paciente: ${variable.pacienteId}'),
          subtitle: Text('Hora: ${variable.fecha}'),
          trailing: Text('Estado: ${variable.state}'),
          initiallyExpanded: _isExpanded[index],
          children: const [
            // Aquí puedes agregar la información adicional que deseas mostrar
            ListTile(title: Text('Información adicional 1')),
            ListTile(title: Text('Información adicional 2')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded[index] = expanded;
            });
          },
        );
      },
    );
  }
}
