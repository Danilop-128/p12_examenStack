import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Producto {
  final int idProducto;
  final String nombre;
  final double precio;

  Producto(
      {required this.idProducto, required this.nombre, required this.precio});
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> productos = [
    {'id': 1, 'nombre': 'tote bag', 'precio': 1000.99},
    {'id': 2, 'nombre': 'shoulder bag', 'precio': 20000.99},
    {'id': 3, 'nombre': 'MK azul', 'precio': 13000.99},
    {'id': 4, 'nombre': 'shoulder bag con correa', 'precio': 24000.99},
    {'id': 5, 'nombre': 'tabby 23', 'precio': 30000.99},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack en columna  Daniela López  Mat:1240'),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Color del texto
          ),
          backgroundColor: Colors.grey,
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final producto = Producto(
              idProducto: productos[index]['id'],
              nombre: productos[index]['nombre'],
              precio: productos[index]['precio'],
            );

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length]
                        .withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${producto.idProducto}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Nombre: ${producto.nombre}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Precio: \$${producto.precio.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
