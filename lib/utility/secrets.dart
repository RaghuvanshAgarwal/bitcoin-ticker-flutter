import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Secrets {
  static final String kCoinGeckoAPIKey = dotenv.get('COIN_GECKO_API_KEY');
}
