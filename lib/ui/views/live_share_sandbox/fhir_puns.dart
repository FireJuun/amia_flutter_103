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
                _PunText('FHIR 🔥 and Ice'),
                _PunText('FHIR-side chat'),
                _PunText('FHIR and Rain'),
                _PunText('Where\'s the FHIR?'),
                _PunText('the FHIRing squad'),
                _PunText('Fight FHIR with FHIR'),
                _PunText('Call code red, this place is on FHIR'),
                _PunText('FHIRTruck'),
                _PunText('Dr. REDSTAT to ED for a FHIR 🔥!'),
                _PunText('I\'m the FHIRstarter, twisted FHIRstarter'),
                _PunText('I got FHIR\'d'),
                _PunText('Liar, Liar, Pants on FHIR'),
                _PunText('Where there\'s smoke, there\'s FHIR'),
                _PunText('FHIRing on all cylinders'),
                _PunText('FHIRwall'),
                _PunText('Great Balls of FHIR'),
                _PunText('We don\'t need no water, let the FHIR burn'),
                _PunText('We didn\'t start the FHIR'),
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
