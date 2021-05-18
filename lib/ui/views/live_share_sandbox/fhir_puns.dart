import 'package:flutter/material.dart';

class FhirPuns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FhirPunsTitle(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pexels-pixabay-417070.jpeg'),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: const <Widget>[
                _PunText('The roof is on FHIR'),
                _PunText('Welcome to the FHIR brigade'),
                _PunText('text'),
                _PunText('text'),
                _PunText('text'),
                _PunText('text'),
                _PunText('text'),
                _PunText('text'),
                _PunText('text'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PunText extends StatelessWidget {
  const _PunText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.apply(color: Colors.white)),
    );
  }
}

class _FhirPunsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).disabledColor,
      width: double.infinity,
      child: Text(
        'FHIR Puns:',
        textAlign: TextAlign.center,
        style:
            Theme.of(context).textTheme.headline3?.apply(color: Colors.white),
      ),
    );
  }
}
