import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '07cd1ca90f6a072c85d77a3a2fdf9ec6';
const url = 'api.openweathermap.org';
const endpoint = '/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var uri = Uri.http(url, endpoint, {
      'appid': apiKey,
      'q': cityName,
      'units': 'metric',
    });

    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var uri = Uri.http(url, endpoint, {
      'appid': apiKey,
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'units': 'metric',
    });

    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
