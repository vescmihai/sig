import 'package:flutter/material.dart';
import './../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BackgroundImage(), // Aquí puedes proporcionar una URL de imagen si deseas
            ElevatedButton(
              child: const Text('Iniciar'),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
      ),
    );
  }
}
