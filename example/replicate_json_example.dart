import 'dart:convert';
import 'package:replicate_json/replicate_json.dart';

//Example using konieshadow's Fooocus api at https://replicate.com/konieshadow/fooocus-api
Future<void> main() async {
  Map<String, Object> input = {
    // input is specific to replicate model, adjust to fit your use
    "prompt": "a dog",
    "cn_type1": "ImagePrompt",
    "cn_type2": "ImagePrompt",
    "cn_type3": "ImagePrompt",
    "cn_type4": "ImagePrompt",
    "sharpness": 2,
    "image_seed": 1,
    "uov_method": "Disabled",
    "image_number": 1,
    "guidance_scale": 4,
    "refiner_switch": 0.5,
    "negative_prompt": "",
    "style_selections": "Fooocus V2,Fooocus Enhance,Fooocus Sharp",
    "uov_upscale_value": 0,
    "outpaint_selections": "",
    "outpaint_distance_top": 0,
    "performance_selection": "Speed",
    "outpaint_distance_left": 0,
    "aspect_ratios_selection": "1152*896",
    "outpaint_distance_right": 0,
    "outpaint_distance_bottom": 0,
    "inpaint_additional_prompt": ""
  };
  String modelVersion =
      "a7e8fa2f96b01d02584de2b3029a8452b9bf0c8fa4127a6d1cfd406edfad54fb"; // model version for replicate api

  String apiKey = "<YOUR_API_KEY>"; //replace with your api key

  String jsonString = await createAndGetJson(
    modelVersion,
    apiKey,
    input,
  );

  var responseJson = jsonDecode(jsonString); //converts string to json object

  // then you can parse the json file to get whatever value you need
  // For this example, I want the 'output', which is a png link
  String pngLink = responseJson['output'][0];
  print(pngLink);
}
