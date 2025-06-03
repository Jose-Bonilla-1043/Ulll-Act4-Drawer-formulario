import 'package:flutter/material.dart';
import 'package:myapp/formularios/detalle_producto.dart';


class Producto extends StatefulWidget {
  const Producto({super.key});

  @override
  State<Producto> createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  // Controladores separados para cada campo
  final _idController = TextEditingController();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _tamanoController = TextEditingController();
  final _colorController = TextEditingController();
  final _precioController = TextEditingController();
  final _marcaController = TextEditingController();

  @override
  void dispose() {
    // Dispose de todos los controladores
    _idController.dispose();
    _nombreController.dispose();
    _descripcionController.dispose();
    _tamanoController.dispose();
    _colorController.dispose();
    _precioController.dispose();
    _marcaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Tabla Producto"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idController,
              fieldName: "ID Producto",
              myIcon: Icons.numbers,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre del Producto",
              myIcon: Icons.shopping_bag,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _descripcionController,
              fieldName: "Descripción",
              myIcon: Icons.description,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _tamanoController,
              fieldName: "Tamaño",
              myIcon: Icons.straighten,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _colorController,
              fieldName: "Color",
              myIcon: Icons.color_lens,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _precioController,
              fieldName: "Precio",
              myIcon: Icons.attach_money,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _marcaController,
              fieldName: "Marca",
              myIcon: Icons.branding_watermark,
            ),
            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade300,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // Validar que los campos no estén vacíos
        if (_idController.text.isEmpty || 
            _nombreController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor complete los campos requeridos')),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              productId: _idController.text,
              productName: _nombreController.text,
              productDescription: _descripcionController.text,
              size: _tamanoController.text,
              color: _colorController.text,
              price: _precioController.text,
              brand: _marcaController.text,
            ),
          ),
        );
      },
      child: const Text(
        'GUARDAR PRODUCTO',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.myController,
    required this.fieldName,
    this.myIcon = Icons.edit,
    this.prefixIconColor = Colors.deepPurple,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15, 
          horizontal: 20
        ),
      ),
    );
  }
}