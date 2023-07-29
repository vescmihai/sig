import 'package:flutter/material.dart';
import './../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UAGRM MAPS')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0),
              Align(
                alignment: Alignment.center,
                child: AlertDialog(
                  title: Text('Bienvenido'),
                  content: Text(
                    'En esta app podra saber como llegar hasta los puntos de ubicaciones que se encuentran dentro de zona en la\n' +
                        '                          UAGRM',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white60,
                ),
              ),
              BackgroundImage(),
              SizedBox(height: 2),
              ElevatedButton(
                child: Text('Seleccione para iniciar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
