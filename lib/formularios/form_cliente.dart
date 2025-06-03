import 'package:flutter/material.dart';
import 'package:myapp/formularios/detalle_cliente.dart';

class Cliente extends StatefulWidget {
  const Cliente({super.key});

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  // Controladores para los campos del cliente
  final _idController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();

  @override
  void dispose() {
    // Dispose de todos los controladores
    _idController.dispose();
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Tabla Cliente"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idController,
              fieldName: "ID Cliente",
              myIcon: Icons.numbers,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre",
              myIcon: Icons.person,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _apellidoController,
              fieldName: "Apellido",
              myIcon: Icons.person_outline,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _emailController,
              fieldName: "Email",
              myIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _telefonoController,
              fieldName: "Teléfono",
              myIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            MyTextField(
              myController: _direccionController,
              fieldName: "Dirección",
              myIcon: Icons.location_on,
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
        // Validar que los campos requeridos no estén vacíos
        if (_idController.text.isEmpty || 
            _nombreController.text.isEmpty ||
            _apellidoController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor complete los campos requeridos')),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleCliente(
              clienteId: _idController.text,
              nombre: _nombreController.text,
              apellido: _apellidoController.text,
              email: _emailController.text,
              telefono: _telefonoController.text,
              direccion: _direccionController.text,
            ),
          ),
        );
      },
      child: const Text(
        'GUARDAR CLIENTE',
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