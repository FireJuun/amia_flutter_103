// ignore_for_file: prefer_single_quotes
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
              "valueCoding": {"code": "0", "display": "The roof is on FHIR"}
            },
            {
              "valueCoding": {
                "code": "1",
                "display": "Welcome to the FHIR brigade"
              },
            },
            {
              "valueCoding": {"code": "2", "display": "The roof is on FHIR"}
            },
            {
              "valueCoding": {
                "code": "3",
                "display": "Welcome to the FHIR brigade"
              }
            },
            {
              "valueCoding": {"code": "4", "display": "FHIR 🔥 and Ice"}
            },
            {
              "valueCoding": {"code": "5", "display": "FHIR-side chat"}
            },
            {
              "valueCoding": {"code": "6", "display": "FHIR and Rain"}
            },
            {
              "valueCoding": {"code": "7", "display": "Where's the FHIR?"}
            },
            {
              "valueCoding": {"code": "8", "display": "the FHIRing squad"}
            },
            {
              "valueCoding": {"code": "9", "display": "Fight FHIR with FHIR"}
            },
            {
              "valueCoding": {
                "code": "10",
                "display": "Call code red, this place is on FHIR"
              }
            },
            {
              "valueCoding": {"code": "11", "display": "FHIRTruck"}
            },
            {
              "valueCoding": {
                "code": "12",
                "display": "Dr. REDSTAT to ED for a FHIR 🔥!"
              }
            },
            {
              "valueCoding": {
                "code": "13",
                "display": "I'm the FHIRstarter, twisted FHIRstarter"
              }
            },
            {
              "valueCoding": {"code": "14", "display": "I got FHIR'd"}
            },
            {
              "valueCoding": {
                "code": "15",
                "display": "Liar, Liar, Pants on FHIR"
              }
            },
            {
              "valueCoding": {
                "code": "16",
                "display": "Where there's smoke, there's FHIR"
              }
            },
            {
              "valueCoding": {
                "code": "17",
                "display": "FHIRing on all cylinders"
              }
            },
            {
              "valueCoding": {"code": "18", "display": "FHIRwall"}
            },
            {
              "valueCoding": {"code": "19", "display": "Great Balls of FHIR"}
            },
            {
              "valueCoding": {
                "code": "20",
                "display": "We don't need no water, let the FHIR burn"
              }
            },
            {
              "valueCoding": {
                "code": "21",
                "display": "We didn't start the FHIR"
              }
            },
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
              "valueCoding": {"code": "0", "display": "The roof is on FHIR"}
            },
            {
              "valueCoding": {
                "code": "1",
                "display": "Welcome to the FHIR brigade"
              },
            },
            {
              "valueCoding": {"code": "2", "display": "The roof is on FHIR"}
            },
            {
              "valueCoding": {
                "code": "3",
                "display": "Welcome to the FHIR brigade"
              }
            },
            {
              "valueCoding": {"code": "4", "display": "FHIR 🔥 and Ice"}
            },
            {
              "valueCoding": {"code": "5", "display": "FHIR-side chat"}
            },
            {
              "valueCoding": {"code": "6", "display": "FHIR and Rain"}
            },
            {
              "valueCoding": {"code": "7", "display": "Where's the FHIR?"}
            },
            {
              "valueCoding": {"code": "8", "display": "the FHIRing squad"}
            },
            {
              "valueCoding": {"code": "9", "display": "Fight FHIR with FHIR"}
            },
            {
              "valueCoding": {
                "code": "10",
                "display": "Call code red, this place is on FHIR"
              }
            },
            {
              "valueCoding": {"code": "11", "display": "FHIRTruck"}
            },
            {
              "valueCoding": {
                "code": "12",
                "display": "Dr. REDSTAT to ED for a FHIR 🔥!"
              }
            },
            {
              "valueCoding": {
                "code": "13",
                "display": "I'm the FHIRstarter, twisted FHIRstarter"
              }
            },
            {
              "valueCoding": {"code": "14", "display": "I got FHIR'd"}
            },
            {
              "valueCoding": {
                "code": "15",
                "display": "Liar, Liar, Pants on FHIR"
              }
            },
            {
              "valueCoding": {
                "code": "16",
                "display": "Where there's smoke, there's FHIR"
              }
            },
            {
              "valueCoding": {
                "code": "17",
                "display": "FHIRing on all cylinders"
              }
            },
            {
              "valueCoding": {"code": "18", "display": "FHIRwall"}
            },
            {
              "valueCoding": {"code": "19", "display": "Great Balls of FHIR"}
            },
            {
              "valueCoding": {
                "code": "20",
                "display": "We don't need no water, let the FHIR burn"
              }
            },
            {
              "valueCoding": {
                "code": "21",
                "display": "We didn't start the FHIR"
              }
            },
          ]
        }
      ]
    }
  ]
};
