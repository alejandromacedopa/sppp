import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListBloc.dart';

class AdminEvidenceListItem extends StatefulWidget {
  final AdminEvidenceListBloc? bloc;
  final Evidence? evidence;

  AdminEvidenceListItem(this.bloc, this.evidence);

  @override
  _AdminEvidenceListItemState createState() => _AdminEvidenceListItemState();
}

class _AdminEvidenceListItemState extends State<AdminEvidenceListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    // Formatear la fecha de creación de manera segura
    String formattedDate = '';
    if (widget.evidence?.createdAt != null) {
      final DateTime? createdAt =
      DateTime.tryParse(widget.evidence!.createdAt!);
      if (createdAt != null) {
        formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(createdAt);
      } else {
        formattedDate = 'Fecha inválida';
      }
    }

    return GestureDetector(
      onTap: () {},
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isPressed ? 0.98 : 1.0),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Título de Evidencia:'),
            _buildMainText(widget.evidence?.name ?? ''),
            SizedBox(height: 12),
            _buildSectionTitle('Descripción:'),
            _buildSubText(widget.evidence?.description ?? ''),
            SizedBox(height: 12),
            _buildSectionTitle('Enlace de Evidencia:'),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.evidence?.evidenceLink ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 23, 90, 206),
                      decoration: TextDecoration.underline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy, color: Colors.blueAccent),
                  onPressed: () {
                    if (widget.evidence?.evidenceLink != null) {
                      Clipboard.setData(
                          ClipboardData(text: widget.evidence!.evidenceLink));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enlace copiado al portapapeles'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.greenAccent[700],
                        ),
                      );
                    }
                  },
                  tooltip: 'Copiar enlace',
                ),
              ],
            ),
            SizedBox(height: 12),
            _buildSubText('Fecha de creación: $formattedDate'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildMainText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
