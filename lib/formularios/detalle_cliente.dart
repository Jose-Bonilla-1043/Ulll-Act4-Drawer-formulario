import 'package:flutter/material.dart';

class DetalleCliente extends StatelessWidget {
  const DetalleCliente({
    super.key,
    required this.clienteId,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    required this.direccion,
  });

  final String clienteId;
  final String nombre;
  final String apellido;
  final String email;
  final String telefono;
  final String direccion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Detalles Cliente", style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 3,
              child: Stack(
                children: [
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () => _showDeleteConfirmation(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 32, 12, 12),
                    child: Column(
                      children: [
                        _buildDetailRow(Icons.numbers, "ID Cliente", clienteId),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.person, "Nombre", nombre),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.person_outline, "Apellido", apellido),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.email, "Email", email),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.phone, "Teléfono", telefono),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.location_on, "Dirección", direccion),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple.shade300, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 2),
                Text(value.isNotEmpty ? value : "N/A", style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Eliminar Cliente", style: TextStyle(fontSize: 16)),
        content: const Text("¿Estás seguro?", style: TextStyle(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar", style: TextStyle(fontSize: 14)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cliente eliminado")),
              );
            },
            child: const Text("Eliminar", style: TextStyle(color: Colors.red, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}