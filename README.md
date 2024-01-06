<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Replicate Dart Package

A Dart package for interacting with the [Replicate](https://replicate.com/) API, enabling seamless communication with their prediction service.

## Features

- **Create Prediction**: Generate predictions based on a specified model, API key, and input data.
- **Get Prediction PNG**: Retrieve the prediction in PNG format using the prediction ID and API key.
- **Create and Get JSON**: Create a prediction and continuously check its status until it is completed, returning the result in JSON format.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  replicate_dart: ^1.0.0
```

## Usage

### import the package
```dart
import 'package:replicate_dart/replicate_dart.dart';
```

### Define the Model, Api key, and desired Inputs
```
String apiKey = "your_replicate_api_key";

// Replace with the desired model version
String model = "your_model_version";

// Replace with your input data
Map<String, Object> inputData = {
"feature1": "value1",
// Add more features as needed for your use
};
```

### Making the api call
createAndGetJson() returns a json string, and is async. After the call is made, the json can be decoded and parsed. 
```
try {
  String jsonString = await createAndGetJson(
    modelVersion,
    apiKey,
    input,
  );

  var responseJson = jsonDecode(jsonString); //converts string to json object

  // then you can parse the json file to get whatever value you need
  // For this example, I want the 'output', which is a png link
  String pngLink = responseJson['output'][0];

} catch (error) {
print('Error: $error');
}
```

### Note:
- Please replace `"your_replicate_api_key"` and `"your_model_version"` with your actual Replicate API key and model version.
- The provided usage example demonstrates how to create predictions, retrieve PNG results, and obtain final results in JSON format. This is all done through one function.

## License

This Replicate Dart package is released under the [MIT License](LICENSE). Feel free to contribute and improve the package!