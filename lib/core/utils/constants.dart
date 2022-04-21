/// Stores constants for appwide usage.
class Constants {
  static const String appName = 'CCalibre';

  static const String apiTokenKey = 'token';

  static const String onboardTokenDescription1 =
      'Since Codemagic does not provide authentication for other users, you need to upload your API token in order to proceed.';
  static const String onboardTokenDescription2 =
      'Make sure you upload .txt file with only token present inside.';
  static const String onboardTokenDescription3 =
      'To know how to get Codemagic API token,';
  static const String addYamlFileNote =
      'In order to use codemagic.yaml for build configuration on Codemagic, it has to be committed to your repository. The name of the file must be codemagic.yaml and it must be located in the root directory of the repository.';
  static const String tokenRetrievedMessage =
      'Your token will be stored securely in this device. If you uninstall the application, token will also get deleted. Click Next to proceed.';
}
