

import 'package:dak_app/presentation/app/view/app_view.dart';
import 'package:dak_app/utils/helpers/api_config.dart';

import 'bootstrap.dart';

void main() {
  APIConfig.baseUrl = 'https://api.digitalpermitbook.com';
  bootstrap(AppView.new);
}
