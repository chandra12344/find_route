class ResRealTimeData {
  ResRealTimeData({
    required this.data,
  });
  late final List<Data> data;

  ResRealTimeData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.dtTime,
    required this.pm2cnc,
    required this.humidity,
    required this.temp,
    required this.deviceid,
  });
  late final String dtTime;
  late final String pm2cnc;
  late final String humidity;
  late final String temp;
  late final String deviceid;

  Data.fromJson(Map<String, dynamic> json){
    dtTime = json['dt_time'];
    pm2cnc = json['pm2.5cnc'];
    humidity = json['humidity'];
    temp = json['temp'];
    deviceid = json['deviceid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt_time'] = dtTime;
    _data['pm2cnc'] = pm2cnc;
    _data['humidity'] = humidity;
    _data['temp'] = temp;
    _data['deviceid'] = deviceid;
    return _data;
  }
}