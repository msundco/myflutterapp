import 'dart:convert';

// Systeminfo systeminfoFromJson(String str) => Systeminfo.fromJson(json.decode(str));

// String systeminfoToJson(Systeminfo data) => json.encode(data.toJson());

class Systeminfo {
  DeviceInfo deviceInfo;
  ManufacturerInfo manufacturerInfo;
  DeviceSettings deviceSettings;
  Statistics statistics;
  CountryInfo countryInfo;
  WebPortalInfo webPortalInfo;
  ClusterInfo clusterInfo;

  Systeminfo({
    required this.deviceInfo,
    required this.manufacturerInfo,
    required this.deviceSettings,
    required this.statistics,
    required this.countryInfo,
    required this.webPortalInfo,
    required this.clusterInfo,
  });

  factory Systeminfo.fromJson(Map<String, dynamic> json) => Systeminfo(
        deviceInfo: DeviceInfo.fromJson(json["deviceInfo"]),
        manufacturerInfo: ManufacturerInfo.fromJson(json["manufacturerInfo"]),
        deviceSettings: DeviceSettings.fromJson(json["deviceSettings"]),
        statistics: Statistics.fromJson(json["statistics"]),
        countryInfo: CountryInfo.fromJson(json["countryInfo"]),
        webPortalInfo: WebPortalInfo.fromJson(json["webPortalInfo"]),
        clusterInfo: ClusterInfo.fromJson(json["clusterInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "deviceInfo": deviceInfo.toJson(),
        "manufacturerInfo": manufacturerInfo.toJson(),
        "deviceSettings": deviceSettings.toJson(),
        "statistics": statistics.toJson(),
        "countryInfo": countryInfo.toJson(),
        "webPortalInfo": webPortalInfo.toJson(),
        "clusterInfo": clusterInfo.toJson(),
      };
}

class ClusterInfo {
  bool clustermaster;
  String clustername;
  int clusterId;
  List<Clusterinverter>? clusterinverters;

  ClusterInfo({
    required this.clustermaster,
    required this.clustername,
    required this.clusterId,
    this.clusterinverters,
  });

  factory ClusterInfo.fromJson(Map<String, dynamic> json) => ClusterInfo(
        clustermaster: json["clustermaster"],
        clustername: json["clustername"],
        clusterId: json["clusterId"],
        clusterinverters: (json["clusterinverters"] as List?)
            ?.map((x) => Clusterinverter.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "clustermaster": clustermaster,
        "clustername": clustername,
        "clusterId": clusterId,
        "clusterinverters": clusterinverters?.map((x) => x.toJson()).toList(),
      };
}

class Clusterinverter {
  int id;
  String systemName;
  String ipAddress;
  String netBiosName;

  Clusterinverter({
    required this.id,
    required this.systemName,
    required this.ipAddress,
    required this.netBiosName,
  });

  factory Clusterinverter.fromJson(Map<String, dynamic> json) =>
      Clusterinverter(
        id: json["id"],
        systemName: json["systemName"],
        ipAddress: json["IpAddress"],
        netBiosName: json["NetBiosName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "systemName": systemName,
        "IpAddress": ipAddress,
        "NetBiosName": netBiosName,
      };
}

class CountryInfo {
  int countryCode;
  String countryName;
  dynamic countryPowerLimit;
  dynamic userPowerLimit;

  CountryInfo({
    required this.countryCode,
    required this.countryName,
    required this.countryPowerLimit,
    required this.userPowerLimit,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        countryPowerLimit: json["countryPowerLimit"],
        userPowerLimit: json["userPowerLimit"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "countryName": countryName,
        "countryPowerLimit": countryPowerLimit,
        "userPowerLimit": userPowerLimit,
      };
}

class DeviceInfo {
  String deviceName;
  String? deviceFamily;
  String serialNumber;
  List<Platform> platform;
  String bundleVersion;
  String articleNumber;
  String netBiosName;
  int nominalPowerWatts;
  List<String> supportedLanguages;
  String? macAddressLan;
  String? macAddressWiFi;

  DeviceInfo({
    required this.deviceName,
    this.deviceFamily,
    required this.serialNumber,
    required this.platform,
    required this.bundleVersion,
    required this.articleNumber,
    required this.netBiosName,
    required this.nominalPowerWatts,
    required this.supportedLanguages,
    this.macAddressLan,
    this.macAddressWiFi,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
        deviceName: json["deviceName"],
        deviceFamily: json["deviceFamily"],
        serialNumber: json["serialNumber"],
        platform: List<Platform>.from(
            json["platform"].map((x) => Platform.fromJson(x))),
        bundleVersion: json["bundleVersion"],
        articleNumber: json["articleNumber"],
        netBiosName: json["NetBiosName"],
        nominalPowerWatts: json["nominalPowerWatts"],
        supportedLanguages:
            List<String>.from(json["supportedLanguages"].map((x) => x)),
        macAddressLan: json["macAddressLAN"],
        macAddressWiFi: json["macAddressWiFi"],
      );

  Map<String, dynamic> toJson() => {
        "deviceName": deviceName,
        "deviceFamily": deviceFamily,
        "serialNumber": serialNumber,
        "platform": List<dynamic>.from(platform.map((x) => x.toJson())),
        "bundleVersion": bundleVersion,
        "articleNumber": articleNumber,
        "NetBiosName": netBiosName,
        "nominalPowerWatts": nominalPowerWatts,
        "supportedLanguages":
            List<dynamic>.from(supportedLanguages.map((x) => x)),
        "macAddressLAN": macAddressLan,
        "macAddressWiFi": macAddressWiFi,
      };
}

class Platform {
  String device;
  String variant;

  Platform({
    required this.device,
    required this.variant,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        device: json["device"],
        variant: json["variant"],
      );

  Map<String, dynamic> toJson() => {
        "device": device,
        "variant": variant,
      };
}

class DeviceSettings {
  String systemName;
  DateTime timestamp;
  String ipAddress;
  String ipInterface;
  String ipAddressAp;
  int rs485Address;
  int canOpenNodeId;
  int canOpenBitrate;

  DeviceSettings({
    required this.systemName,
    required this.timestamp,
    required this.ipAddress,
    required this.ipInterface,
    required this.ipAddressAp,
    required this.rs485Address,
    required this.canOpenNodeId,
    required this.canOpenBitrate,
  });

  factory DeviceSettings.fromJson(Map<String, dynamic> json) => DeviceSettings(
        systemName: json["systemName"],
        timestamp: DateTime.parse(json["timestamp"]),
        ipAddress: json["IpAddress"],
        ipInterface: json["IpInterface"],
        ipAddressAp: json["IpAddressAP"],
        rs485Address: json["rs485Address"],
        canOpenNodeId: json["canOpenNodeId"],
        canOpenBitrate: json["canOpenBitrate"],
      );

  Map<String, dynamic> toJson() => {
        "systemName": systemName,
        "timestamp": timestamp.toIso8601String(),
        "IpAddress": ipAddress,
        "IpInterface": ipInterface,
        "IpAdressAP": ipAddressAp,
        "rs485Address": rs485Address,
        "canOpenNodeId": canOpenNodeId,
        "canOpenBitrate": canOpenBitrate,
      };
}

class ManufacturerInfo {
  String manufacturer;
  String manufacturerUrl;

  ManufacturerInfo({
    required this.manufacturer,
    required this.manufacturerUrl,
  });

  factory ManufacturerInfo.fromJson(Map<String, dynamic> json) =>
      ManufacturerInfo(
        manufacturer: json["manufacturer"],
        manufacturerUrl: json["manufacturerURL"],
      );

  Map<String, dynamic> toJson() => {
        "manufacturer": manufacturer,
        "manufacturerURL": manufacturerUrl,
      };
}

class Statistics {
  int systemRunTime;
  dynamic configDateTime;
  int emergencyRunTime;

  Statistics({
    required this.systemRunTime,
    required this.configDateTime,
    required this.emergencyRunTime,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        systemRunTime: json["systemRunTime"],
        configDateTime: json["configDateTime"],
        emergencyRunTime: json["emergencyRunTime"],
      );

  Map<String, dynamic> toJson() => {
        "systemRunTime": systemRunTime,
        "configDateTime": configDateTime,
        "emergencyRunTime": emergencyRunTime,
      };
}

class WebPortalInfo {
  String webPortal;
  List<String> supportedWebPortals;

  WebPortalInfo({
    required this.webPortal,
    required this.supportedWebPortals,
  });

  factory WebPortalInfo.fromJson(Map<String, dynamic> json) => WebPortalInfo(
        webPortal: json["webPortal"],
        supportedWebPortals:
            List<String>.from(json["supportedWebPortals"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "webPortal": webPortal,
        "supportedWebPortals":
            List<dynamic>.from(supportedWebPortals.map((x) => x)),
      };
}
