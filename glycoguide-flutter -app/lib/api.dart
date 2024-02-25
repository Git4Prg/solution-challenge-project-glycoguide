import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> fetchData(String input) async {
  List<Map<String, String>> inputList = [
    {'text': "input: $input"},
    {'text': "output: "}
  ];
  try {
    Dio dio = Dio();
    final response = await dio.post(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${dotenv.env["APIKEY"]}",
      data: {
        "contents": [
          {
            "parts": [
              partsText,
              inputList,
            ],
          },
        ],
        "generationConfig": {
          "temperature": 0.6,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 2048,
          "stopSequences": []
        },
        "safetySettings": [
          {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          }
        ]
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final verdict =
          response.data['candidates'][0]['content']['parts'][0]['text'];
      return verdict;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log(e.toString());
    return '';
  }
}

List<Map<String, String>> partsText = [
  {
    "text":
        "input: I will give you name of a food item or dish. Tell me if that item or dish is good for people suffering from type 1 diabetes or not and write a little bit of detail about it and why it'\''s good or why it'\''s not good. Try to keep the response within 80 words"
  },
  {"text": "output: "},
  {"text": "input: dhokla"},
  {
    "text":
        "output: Dhokla is a steamed savory cake made from fermented batter derived from rice and split chickpeas. It is a good option for people with type 1 diabetes as it has a low glycemic index, meaning it releases glucose slowly into the bloodstream. Additionally, dhokla is a good source of protein and fiber, which can help manage blood sugar levels."
  },
  {"text": "input: apple"},
  {
    "text":
        "output: Apples are a good choice for people with type 1 diabetes. They have a low glycemic index, meaning they release glucose slowly into the bloodstream. Additionally, apples are a good source of fiber, which can help manage blood sugar levels."
  },
  {"text": "input: cake"},
  {
    "text":
        "output: Cake is generally not a good choice for people with type 1 diabetes. It is high in sugar and carbohydrates, which can cause blood sugar levels to spike. Additionally, cake is often made with refined flour, which can also raise blood sugar levels quickly."
  },
  {"text": "input: donuts"},
  {
    "text":
        "output: Donuts are generally not a good choice for people with type 1 diabetes. They are high in sugar and carbohydrates, which can cause blood sugar levels to spike. Additionally, donuts are often made with refined flour, which can also raise blood sugar levels quickly."
  },
  {"text": "input: chawal daal bhindi ki sabji"},
  {
    "text":
        "output: Chawal daal bhindi ki sabji is a popular Indian dish made with rice, lentils, and okra. It is a good option for people with type 1 diabetes as it has a low glycemic index, meaning it releases glucose slowly into the bloodstream. Additionally, the dish is a good source of protein and fiber, which can help manage blood sugar levels."
  },
  {"text": "input: matar paneer"},
  {
    "text":
        "output: Matar paneer is a popular Indian dish made with peas and paneer (a type of cheese). It is a good option for people with type 1 diabetes as it has a low glycemic index, meaning it releases glucose slowly into the bloodstream. Additionally, the dish is a good source of protein and fiber, which can help manage blood sugar levels."
  },
  {"text": "input: chole bhature"},
  {
    "text":
        "output: Chole bhature is a popular Indian dish made with chickpeas and fried bread. It is not a good choice for people with type 1 diabetes as it is high in carbohydrates and can cause blood sugar levels to spike. Additionally, the fried bread is high in fat and can contribute to weight gain."
  },
  {"text": "input: oats"},
  {
    "text":
        "output: Oats are a good choice for people with type 1 diabetes. They are a good source of soluble fiber, which can help slow down the absorption of sugar into the bloodstream. Additionally, oats have a low glycemic index, meaning they release glucose slowly into the bloodstream."
  }
];
