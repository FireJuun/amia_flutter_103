final fhirDemoJson = {
  "resourceType": "Questionnaire",
  "title": "flutter_103_fhir_demo",
  "item": [
    {
      "linkId": "/fhir_demo",
      "text": "FHIR Demo",
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
                    "code": "radio-button",
                    "display": "Radio Button"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/1",
          "text": "Is this for testing or for feedback?",
          "type": "choice",
          "answerOption": [
            {"valueString": "Testing"},
            {"valueString": "Feedback"}
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
                    "code": "slider",
                    "display": "Slider"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/2",
          "text": "My knowledge about Flutter before / after:",
          "type": "choice",
          "answerOption": [
            {"valueString": "Minimal"},
            {"valueString": "Expert"}
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
                    "code": "slider",
                    "display": "Slider"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/3",
          "text": "My knowledge about FHIR before / after:",
          "type": "choice",
          "answerOption": [
            {"valueString": "Minimal"},
            {"valueString": "Expert"}
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
                    "code": "slider",
                    "display": "Slider"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/4",
          "text":
              "I believe this workshop is valuable for informatics practice",
          "type": "choice",
          "answerOption": [
            {"valueString": "Not at all"},
            {"valueString": "Significantly"}
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
                    "code": "slider",
                    "display": "Slider"
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/5",
          "text": "Perceived difficulty level of workshop:",
          "type": "choice",
          "answerOption": [
            {"valueString": "Easy to pick up"},
            {"valueString": "Difficult to follow"}
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
                    "code": "text",
                    "display": ""
                  }
                ]
              }
            }
          ],
          "linkId": "/fhir_demo/6",
          "text": "Favorite thing about this workshop:",
          "type": "text"
        },
        {
          "linkId": "/fhir_demo/7",
          "text": "Suggestions for improvement",
          "type": "string"
        }
      ]
    }
  ]
};
