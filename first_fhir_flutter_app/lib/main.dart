import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Create Patient',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreatePatient(),
    );
  }
}

class CreatePatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _lastName = TextEditingController();
    final _firstName = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //* Hapi FHIR calls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _nameContainer(_lastName, 'Last name'),
              _nameContainer(_firstName, 'First name'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SmallActionButton(
                  title: 'Hapi: Create',
                  onPressed: () => _hapiCreate(
                        _firstName.text,
                        _lastName.text,
                      )),
              SmallActionButton(
                title: 'Hapi: Search',
                onPressed: () => _hapiSearch(
                  _firstName.text,
                  _lastName.text,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _nameContainer(TextEditingController name, String text) =>
      Container(
        width: Get.width / 3,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: name,
          decoration: InputDecoration(hintText: text),
        ),
      );

  Future _hapiCreate(String lastName, String firstName) async {
    final newPatient = Patient(
      resourceType: R4ResourceType.Patient,
      name: [
        HumanName(
          given: [firstName],
          family: lastName,
        ),
      ],
    );
    final newRequest = FhirRequest.create(
      base: Uri.parse('https://hapi.fhir.org/baseR4'),
      resource: newPatient,
    );
    final response = await newRequest
        .request(headers: {'Content-Type': 'application/fhir+json'});
    if (response?.resourceType == R4ResourceType.Patient) {
      Get.rawSnackbar(
          title: 'Success',
          message: 'Patient ${(response as Patient).name?[0].given?[0]}'
              ' ${response.name?[0].family} created');
    } else {
      Get.snackbar('Failure', '${response?.toJson()}',
          snackPosition: SnackPosition.BOTTOM);
      print(response?.toJson());
    }
  }

  Future _hapiSearch(
    String lastName,
    String firstName,
  ) async {
    await launch('http://hapi.fhir.org/baseR4/'
        'Patient?'
        'given=$firstName&'
        'family=$lastName&'
        '_pretty=true');
  }
}

class SmallActionButton extends StatelessWidget {
  const SmallActionButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme.fromButtonThemeData(
      data: Get.theme.buttonTheme.copyWith(minWidth: Get.width / 3),
      child: ElevatedButton(child: Text(title), onPressed: onPressed),
    );
  }
}
