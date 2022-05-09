class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  // unnamed constructor - when called, sets the fields
  // only one unnamed constructor per class
  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  // named constructor - fromJson is name of constructor
  // takes a Map and returns an instance of Weather
  Weather.fromJson(Map<String, dynamic> weatherMap) {
    this.name = weatherMap['name'] ?? '';
    this.temperature = weatherMap['main']['temp'] * (9 / 5) - 459.67 ?? 0;
    this.perceived = weatherMap['main']['feels_like'] * (9 / 5) - 459.67 ?? 0;
    this.pressure = weatherMap['main']['pressure'] ?? 0;
    this.humidity = weatherMap['main']['humidity'] ?? 0;
    this.description = weatherMap['weather'][0]['main'] ?? '';
  }
}
