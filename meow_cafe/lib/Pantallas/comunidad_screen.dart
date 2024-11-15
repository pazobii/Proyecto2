import 'package:flutter/material.dart';

class ComunidadScreen extends StatefulWidget {
  @override
  _ComunidadScreenState createState() => _ComunidadScreenState();
}

class _ComunidadScreenState extends State<ComunidadScreen> {

  List<String> comentarios = [];

  TextEditingController comentarioController = TextEditingController();

  // AGREGAR COMENTARIO A LA LISTA
  void _agregarComentario() {
    if (comentarioController.text.isNotEmpty) {
      setState(() {
        comentarios.add(comentarioController.text);
        comentarioController.clear(); // Limpiar el campo de texto
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comeownidad',
          style: TextStyle(color: Color(0xFFfc98a4)), 
        ),
        backgroundColor: Color(0xFFFef9c2),
      ),
      backgroundColor: Color(0xFFb1e1a3), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido a la Comeownidad!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfc98a4), 
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Escribe tus comentarios sobre el café aquí:',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFfc98a4), 
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: comentarioController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu comentario',
                labelStyle: TextStyle(color: Color(0xFFfc98a4)), 
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _agregarComentario,
              child: Text(
                'Enviar Comentario',
                style: TextStyle(color: Colors.white), 
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFfc98a4),
              ),
            ),
            SizedBox(height: 20),
            // COMENTARIOS
            Expanded(
              child: ListView.builder(
                itemCount: comentarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      comentarios[index],
                      style: TextStyle(color: Color(0xFFfc98a4)), 
                    ),
                    tileColor: Color(0xFFFef9c2),
                    contentPadding: EdgeInsets.all(8.0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}