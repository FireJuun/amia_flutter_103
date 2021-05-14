const fhirLiveshareJson = {
  "resourceType": "Questionnaire",
  "title": "flutter_103_fhir_liveshare",
  "item": [
    {
      "linkId": "/fhir_liveshare",
      "text": "FHIR Liveshare",
      "type": "group",
      "item": [
        {
          "extension": [
            {
              "url":
                  "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://hl7.org/fhir/questionnaire-item-control",
                    "code": "check-box",
                    "display": "Check-box"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_liveshare/1",
          "text": "Good FHIR puns (each vote counts as 1)",
          "type": "choice",
          "answerOption": [
            {
              "valueCoding": {"code": "0", "display": "Always"}
            },
            {
              "valueCoding": {"code": "1", "display": "Sometimes"}
            }
          ]
        },
        {
          "extension": [
            {
              "url":
                  "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://hl7.org/fhir/questionnaire-item-control",
                    "code": "radio-button",
                    "display": "Radio Button"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_liveshare/2",
          "text": "Favorite FHIR pun (vote counts as 5)",
          "type": "choice",
          "answerOption": [
            {
              "valueCoding": {"code": "0", "display": "Always"}
            },
            {
              "valueCoding": {"code": "1", "display": "Sometimes"}
            }
          ]
        }
      ]
    }
  ]
};
