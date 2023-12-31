import 'package:flutter/material.dart';
import 'package:sig/src/model/section_model.dart';
import 'package:sig/src/widget/carousel_img_widget.dart';

class InformationPanelW extends StatelessWidget {
  final Section? selectedSection;
  const InformationPanelW({super.key, required this.selectedSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Icon(Icons.drag_handle),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedSection?.descripcion ?? 'Sin datos',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                selectedSection?.edificio.toString() ?? 'Sin datos',
              ),
            ],
          ),
        ),
        CarouselImageWidget(
          edificioCode: selectedSection?.codEdificio.toString() ?? '',
          sectionCode: selectedSection?.code.toString() ?? '',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedSection?.codEdificio != null)
                Text(
                    'Módulo ${selectedSection?.codEdificio}, ${selectedSection?.piso}'),
              Text(
                selectedSection?.capacidadMax != null
                    ? 'Capacidad max: ${selectedSection?.capacidadMax} personas'
                    : 'Capacidad max: ?',
              ),
              Text(
                selectedSection?.recursos != null
                    ? 'Recursos: ${selectedSection?.recursos}'
                    : 'Recursos: ?',
              ),
              Text(
                selectedSection?.tipo != null
                    ? 'Tipo: ${selectedSection?.tipo}'
                    : 'Tipo: ?',
              ),
              Text(
                selectedSection?.ciudad != null
                    ? 'Ciudad: ${selectedSection?.ciudad}'
                    : 'Ciudad: ?',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
