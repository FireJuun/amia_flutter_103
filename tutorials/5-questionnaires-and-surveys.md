---
title: "Questionnaires and Surveys"
date: 2021-05-16T23:55:03Z
type: post
author: Grey Faulkenberry, MD MPH
tags: ["FHIR","Questionnaire", "Survey", "Flutter", "Prapare"]
---
# FHIR Questionnaire
As usual, the FHIR documentation, while complete, is difficult to get through in order to understand how to structure surveys. John has created a really nice demo app to render the Prapare® Survey specifically (https://github.com/FireJuun/prapare). There is also now a very nice dynamic renderer package called [Faiadashu](https://pub.dev/packages/faiadashu), thanks [Tilo](https://github.com/tiloc)!

I'm also working on creating surveys from a REDCap library, and also from a spreadsheet, but those are works in progress. However, in the meantime, I thought I would step through how to format a questionnaire in FHIR.

It is helpful (although not complete) to review the FHIR Questionnaire Resource. There is also a nice form builder that, while occasionally inaccurate (in my opinion) is still really helpful.  You can find it here https://lhcformbuilder.nlm.nih.gov/. As usual however, for automated tasks, there are some nuances that I think it misses. So, in order to truly understand Questionnaires, we're going to step through how to do it by hand. That way, as with so many things, you can use the above tool for the first pass, and then go in and correct any details as you feel you need to.

I always think better when I see an example. So, while this is going to be a long journey, we're going to walk through our proposal on how to properly code the PRAPARE Survey. The survey is an acronym for Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences. (main website: https://www.nachc.org/research-and-data/prapare/). This is a survey designed to assess social determinants of health (SDOH), an area that has traditionally not been a major focus, but has come into the spotlight as we understand better how much these effect a person's health (answer: more than almost anything else).

So, once again, we're going to step through how we code this survey. I expect this to be long, simply because there's a lot of code involved, even just to design something simple. So we're going to start with basic layout of the Questionnaire. 

```json
{
  "status": "draft",
  "resourceType": "Questionnaire",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire|2.7"
    ],
    "tag": [
      {
        "code": "lformsVersion: 25.1.3"
      }
    ]
  },
  "item": []
}
```
So, pretty simple. Status can have values of draft, active, retired, or unknown. The other fields are all typical FHIR fields so I won't go into them. Item is the real focus of what we're going to do. As we see it's a list and all of the items in the actual Questionnaire are going to be placed here.

Again, refer to the FHIR documentation for the full explanation of the spec, I'm only going to cover what I feel is important, specifically in the context of the PRAPARE Survey (if you want to go nuts, checkout the SDC Home Page, Advanced form rendering,  Advanced form behavior and calculation, and Adaptive forms). In Item, there are a number of fields (I refer to them as fields, the proper term is probably attributes if we're using an object oriented perspective), the two that are required are linkId and type.

linkId: a unique id for that item in the Questionnaire. While this is not stated specifically in the spec, they seem to come in two varieties, separated by "." or "/". The "." ends up looking like an ip adress: 1.1.2, while the "/" ends up looking like a directory of loinc codes (because often they are): /93043-8/93035-4/93044-9. I found this in a presentation (but I couldn't find it on the HL7 page) these also appear to correspond to depth. Thus, for 1.1.2, this could be the first group, within that first group the first question, and of the predefined answers to that question. Also, speaking of loinc codes, it's unfortunate that the display text for some of the loinc codes are not actually the same as the text for the question they refer to. ToDo: ensure loinc text is correct. 
```
Group 1 (93043-8)  
    Question 1 (93035-4)
        Answer 1 (93044-8)
        Answer 2 (93044-9)
        Answer 3 (93044-7)
    Question 2 (93035-5)
        Answer 1 (93044-6)
        Answer 2 (93044-5)
-Group 2 (93043-9)...|
```
type can be  any of the following: group, display, boolean, decimal, integer, date, dateTime, time, string, text, url, choice, open-choice, attachment, reference, and quantity. These are mostly self explanatory, plus the official definitions are pretty good, so I won't redefine them here. So, how do we want to proceed. All of the representations I have seen for PRAPARE have the entire survey as a group, with sections nested beneath it (I think you could probably just start with the sections, but as this seems to be the standard, it's what we're going to go with). So the item list above will now look like the following:

```json
  "item": [
    {
      "type": "group",
      "code": [
        {
          "code": "93025-5",
          "display": "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]",
          "system": "http://loinc.org"
        }
      ],
      "required": false,
      "linkId": "/93025-5",
      "text": "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]",
      "item": []
      }
   ]
```
#### PRAPARE Survey Sections
1. Personal Characteristics
2. Family & Home
3. Money & Resources
4. Social and Emotional Health
5. Optional Additional Questions 

So for this item, we have again defined a linkId and type (as they are both required). We have specified that this item does not HAVE to be included in the data results ("required"). The code field is the corresponding concept in a terminology (in this case loinc - and also the linkId is the loinc code). The text is the text that could be displayed to the user (although this is up to the rendering software). 

Within this item is another item. It is again a list, and this time we will need to refer to the PRAPARE questionnaire. We can see that it naturally structures itself in sections, Personal Characteristics, Family & Home, Money & Resources, Social and Emotional Health, and Optional Additional Questions. These are a natural fit for the group type. Below we can see how we define the first two of the above sections. (here is a list of the loinc codes).
```json
{
    "type": "group",
    "code": [
    {
        "code": "93043-8",
        "display": "Personal characteristics",
        "system": "http://loinc.org"
    }
    ],
    "required": false,
    "linkId": "/93043-8",
    "text": "Personal characteristics",
    "item": []
},
{
    "type": "group",
    "code": [
    {
        "code": "93042-0",
        "display": "Family and home",
        "system": "http://loinc.org"
    }
    ],
    "required": false,
    "linkId": "/93042-0",
    "text": "Family and home",
    "item": []
}
```

&nbsp;&nbsp;&nbsp;&nbsp;Question Formats in FHIR &nbsp;&nbsp;&nbsp;&nbsp; | Fhir AnswerOption Types
:---:|:---:
autocomplete | valueCoding
drop-down | valueInteger
check-box | valueDate
lookup | valueTime
radio-button | valueString
slider | valueReference
spinner | 
text-box| 
  

So far we have been pretty generic with what we've done so far, and can easily be applied to many questionnaires. For the next level down, however, we will need to take a deep dive into the PRAPARE questionnaire as we discover how to properly represent the individual questions.

I think I'm just going to post the entire question code and step through it. For the type, we have choice. Officially this is defined as: Question with a Coding drawn from a list of possible answers (specified in either the answerOption property, or via the valueset referenced in the answerValueSet property) as an answer (valueCoding). For us that means that there will be a list of answers that will be represented (as opposed to a free-text answer). We have an extension that defines in what format that question should be represented. (the links below work, but are not release specific - so if you want stu3 or dstu2 you'll have to go looking for them). the options are: autocomplete, drop-down, check-box, lookup, radio-button, slider, spinner, and text-box.

For this specific question, most representations have drop-down, but we feel that radio-button better represents the original survey. The linkId is the combination of the section (group) code and the individual question code. For a choice, it allows both a list of answerOption or a valueSet. The latter can provide more detailed control, but is more complicated. For this question we don't need it, and will stick with answerOption. As we are using a codified set, we use valueCoding, along with the values below (again, all loinc). If it is not a predefined system, you can also choose valueInteger, valueDate, valueTime, valueString, or valueReference.

```json
{
    "type": "choice",
    "code": [
    {
        "code": "56051-6",
        "display": "Are you Hispanic or Latino?",
        "system": "http://loinc.org"
    }
    ],
    "extension": [
    {
        "url": "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
        "valueCodeableConcept": {
        "coding": [
            {
            "system": "http://hl7.org/fhir/questionnaire-item-control",
            "code": "radio-button",
            "display": "Radio button"
            }
        ],
        "text": "Radio button"
        }
    }
    ],
    "required": false,
    "linkId": "/93043-8/56051-6",
    "text": "Are you Hispanic or Latino?",
    "answerOption": [
    {
        "valueCoding": {
        "code": "LA33-6",
        "display": "Yes"
        }
    },
    {
        "valueCoding": {
        "code": "LA32-8",
        "display": "No"
        }
    },
    {
        "valueCoding": {
        "code": "LA30122-8",
        "display": "I choose not to answer this question"
        }
    }
    ]
},
```
For question 2 we start to get a little more complicated. It is very similar to the above question in terms of setup and answerOptions. One smaller difference is that we have "repeats": true. This means that multiple answers can be given for this question. FHIR specifically states that this may mean that the question itself is repeated, with a different answer each time, OR it can mean that multiple answers can be selected for a single question (we generally prefer the latter). However, the main difference with this question is that at the end we have a child item.
```json
{
    "type": "choice",
    "code": [
    {
        "code": "32624-9",
        "display": "Which race(s) are you? Check all that apply.",
        "system": "http://loinc.org"
    }
    ],
    "extension": [
    {
        "url": "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
        "valueCodeableConcept": {
        "coding": [
            {
            "system": "http://hl7.org/fhir/questionnaire-item-control",
            "code": "check-box",
            "display": "Check box"
            }
        ],
        "text": "Check box"
        }
    }
    ],
    "required": false,
    "repeats": true,
    "linkId": "/93043-8/32624-9",
    "text": "Which race(s) are you? Check all that apply.",
    "answerOption": [
    {
        "valueCoding": {
        "code": "LA6156-9",
        "display": "Asian"
        }
    },
    {
        "valueCoding": {
        "code": "LA14045-1",
        "display": "Native Hawaiian"
        }
    },
    {
        "valueCoding": {
        "code": "LA30187-1",
        "display": "Pacific Islander"
        }
    },
    {
        "valueCoding": {
        "code": "LA14042-8",
        "display": "Black/African American"
        }
    },
    {
        "valueCoding": {
        "code": "LA4457-3",
        "display": "White"
        }
    },
    {
        "valueCoding": {
        "code": "LA4-4",
        "display": "American Indian/Alaskan Native"
        }
    },
    {
        "valueString": {
        "code": "LA46-8",
        "display": "Other"
        }
    },
    {
        "valueCoding": {
        "code": "LA30122-8",
        "display": "I choose not to answer this question"
        }
    }
    ],
    "item": [
    {
        "type": "string",
        "required": "false",
        "linkId": "/93043-8/32624-9/LA46-8",
        "text": "Please write",
        "enableWhen": [
        {
            "answerCoding": {
            "code": "LA46-8"
            },
            "question": "/93043-8/32624-9",
            "operator": "="
        }
        ],
        "enableBehavior": "all"
    }
    ]
},
```
We have included this nested child-item because when we refer to the original survey, we see that if the user selects "Other" they are given the opportunity to provide a free-text answer. So in order to give this option, our child-item is of "type": "string", but isn't required. The linkId is as for other items, and then the text to display with the item. The logic comes from the enableWhen field. We have specified that for the question /93043-8/32624-9, if the answerCoding is equal (defined by the operator) to the code specified (LA46-8). Instead of answerCoding, you can also specify answer[x] (where x is any of the types that are allowed in answers). enableBehavior may be all or any. This specifies that the item should be shown only if all of the conditions specified are true or if any are true.

Question 3 and Question 4 in the survey are almost identical to question 1 in Figure 4.

Question 5 is simply a free-text field. In some versions of the survey they do seem to offer choices for this answer, but in the original, it is simply a free text. We have therefore chosen to represent it as follows:
```json
{
    "type": "text",
    "code": [
    {
        "code": "54899-0",
        "display": "What language are you most comfortable speaking?",
        "system": "http://loinc.org"
    }
    ],
    "required": false,
    "linkId": "/93043-8/54899-0",
    "text": "What language are you most comfortable speaking?"
}
```
So there was some discussion in our group about the best way to render Question 6. After discussion we decided that we think the best  way to do it is to define it as a question with a integer response, but with a nested sub-item for if the user chooses not to answer the question. It looks like the following:
```json
{
    "type": "integer",
    "code": [
    {
        "code": "63512-8",
        "display": "How many family members, including yourself, do you currently live with?",
        "system": "http://loinc.org"
    }
    ],
    "extension": [
    {
        "url": "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
        "valueCoding": {
        "display": "{#}"
        }
    }
    ],
    "required": false,
    "linkId": "/93042-0/63512-8",
    "text": "How many family members, including yourself, do you currently live with?",
    "item": [
    {
        "type": "boolean",
        "code": [
        {
            "code": "LA30122-8",
            "display": "I choose not to answer this question"
        }
        ],
        "text": "I choose not to answer this question"
    }
    ]
},
```
Question 7 and Question 8 are the same format as multiple question above.

Question 9 has what appear to be two free text fields for one question. As I've discovered, some of Questionnaire (like much of FHIR) seems to be the choice of the developers, coders, renderers, etc. We are going to try and keep this as generic as possible to be as broadly applicable as possible. Currently, we are just going to list it as a single. However, in the future we may look into pulling it as a reference from the Patient's address. (Also, yes, the incorrect grammar of the question bothers me too).
```json
{
    "type": "group",
    "code": [
    {
        "code": "56799-0",
        "display": "What address do you live at?",
        "system": "http://loinc.org"
    }
    ],
    "required": false,
    "linkId": "/93042-0/56799-0",
    "text": "What address do you live at?",
    "item": [
    {
        "type": "string",
        "required": "false",
        "linkId": "/93042-0/56799-0/street",
        "text": "Street:"
    },
    {
        "type": "string",
        "required": "false",
        "linkId": "/93042-0/56799-0/city_state_zip",
        "text": "City, State, Zipcode:"
    }
    ]
}
```
Questions 10-13 are all similar to questions we've already discussed, so I won't belabor those points. 

At first glance 14 appears complicated. It is slightly, but it is really just deeper nests of the kinds of questions that we've already encountered. The group starts out similarly, coding, systems, text, linkId, etc. The first six items we've seen similar versions before (Food, Utilities, Clothing, Child care, Medical, and Phone), and so I've only included Phone below. The option for Other is also similar to how we've done before, where there is display logic for a free-text box when this is chosen. Lastly, we've included a boolean question, which we haven't used before. There could be a discussion about whether or not to include the formatting (should this also be displayed as a radio-button, or perhaps a check-box?). For now we're going to leave it to the renderer, but feel free to add the format as an extension to your survey if you feel it is appropriate.
```json
{
    "type": "group",
    "code": [
    {
        "code": "93031-3",
        "display": "In the past year, have you or any family members you live with been unable to get any of the following when it was really needed?",
        "system": "http://loinc.org"
    }
    ],
    "required": false,
    "linkId": "/93041-2/93031-3",
    "text": "In the past year, have you or any family members you live with been unable to get any of the following when it was really needed?",
    "item": [
    {
        "type": "choice",
        "code": [
        {
            "code": "LA30128-5",
            "display": "Phone",
            "system": "http://loinc.org"
        }
        ],
        "required": false,
        "linkId": "/93041-2/93031-3/LA30128-5",
        "text": "Phone",
        "answerOption": [
        {
            "valueCoding": {
            "code": "LA33-6",
            "display": "Yes"
            }
        },
        {
            "valueCoding": {
            "code": "LA32-8",
            "display": "No"
            }
        }
        ]
    },
    {
        "type": "choice",
        "code": [
        {
            "code": "LA46-8",
            "display": "Other",
            "system": "http://loinc.org"
        }
        ],
        "required": false,
        "linkId": "/93041-2/93031-3/LA46-8",
        "text": "Other",
        "answerOption": [
        {
            "valueCoding": {
            "code": "LA33-6",
            "display": "Yes"
            }
        },
        {
            "valueCoding": {
            "code": "LA32-8",
            "display": "No"
            }
        }
        ],
        "item": [
        {
            "type": "string",
            "required": "false",
            "linkId": "/93041-2/93031-3/LA46-8/LA33-6",
            "text": "Please write",
            "enableWhen": [
            {
                "answerCoding": {
                "code": "LA33-6"
                },
                "question": "/93041-2/93031-3/LA46-8",
                "operator": "="
            }
            ],
            "enableBehavior": "all"
        }
        ]
    },
    {
        "type": "boolean",
        "code": [
        {
            "code": "LA30122-8",
            "display": "I choose not to answer this question",
            "system": "http://loinc.org"
        }
        ],
        "required": false,
        "linkId": "/93041-2/93031-3/LA30122-8",
        "text": "I choose not to answer this question"
    }
    ]
},
```
Question 15 is similar to previous questions. Although please note that multiple answers are allowed, so we specified a check-box format.

Both of the Social and emotional health questions, as well as all questions from the Optional section are simple choice responses. I will note that currently for the final question, there is no known coding for the response "I have not had a partner in the past year". 

So there you have it. This was our process of creating the PRAPARE questionnaire in FHIR. We hope you found it useful, and feedback is always welcome on how we can improve.