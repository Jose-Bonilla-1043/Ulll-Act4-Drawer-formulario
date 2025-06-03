import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.size,
    required this.color,
    required this.price,
    required this.brand,
  });

  final String productId;
  final String productName;
  final String productDescription;
  final String size;
  final String color;
  final String price;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Detalles", style: TextStyle(fontSize: 18)),
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
                        _buildDetailRow(Icons.numbers, "ID", productId),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.shopping_bag, "Nombre", productName),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.description, "Descripción", productDescription),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.straighten, "Tamaño", size),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.color_lens, "Color", color),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.attach_money, "Precio", "\$$price"),
                        const Divider(height: 12),
                        _buildDetailRow(Icons.branding_watermark, "Marca", brand),
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
        title: const Text("Eliminar Producto", style: TextStyle(fontSize: 16)),
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
                const SnackBar(content: Text("Producto eliminado")),
              );
            },
            child: const Text("Eliminar", style: TextStyle(color: Colors.red, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}