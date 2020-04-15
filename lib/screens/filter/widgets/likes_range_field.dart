import 'package:clube_da_obra/helpers/format_field.dart';
import 'package:clube_da_obra/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LikesRangeField extends StatelessWidget {

  LikesRangeField({this.filter});

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Min'
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            initialValue: filter.minLikes?.toString(),
            onSaved: (s) {
              if(s.isEmpty)
                filter.minLikes = null;
              else
                filter.minLikes = int.parse(getSanitizedText(s));
            },
            validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return "Utilize valores válidos";
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Max'
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            initialValue: filter.maxLikes?.toString(),
            onSaved: (s) {
              if(s.isEmpty)
                filter.maxLikes = null;
              else
                filter.maxLikes = int.parse(getSanitizedText(s));
            },
            validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return "Utilize valores válidos";
              return null;
            },
          ),
        ),
      ],
    );
  }
}
