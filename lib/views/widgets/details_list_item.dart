import 'package:flutter/material.dart';

import '../../constants.dart';

class DetailsListItem extends StatelessWidget {
  final String labelText;
  const DetailsListItem({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 10),
        const Icon(Icons.circle, size: 10),
        const SizedBox(width: 10),
        Expanded(
          child: Text(labelText,
              style: const TextStyle(fontSize: 18, color: textColor)),
        ),
      ],
    );
  }
}
