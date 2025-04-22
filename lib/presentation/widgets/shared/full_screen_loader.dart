import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    const messages = <String>[
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Encontrando las películas populares',
      'El Señor de los Anillos es la mejor película del mundo ¿Ok?',
      'Ou, esto esta tardando mas de lo esperado :(',
      'Creo que tu internet es un poco malo =D',
    ];

    return Stream.periodic(
      const Duration(seconds: 4),
      (step) => messages[step],
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Cargando...');
                }

                return Text(snapshot.data!, textAlign: TextAlign.center);
              },
            ),
          ),
        ],
      ),
    );
  }
}
