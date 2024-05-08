class FirebaseConfig {
  late String apiKey;
  late String authDomain;

  late String projectId;
  late String storageBucket;
  late String messagingSenderId;
  late String appId;

  FirebaseConfig(
      {required this.apiKey,
      required this.authDomain,
      required this.projectId,
      required this.storageBucket,
      required this.messagingSenderId,
      required this.appId});

  FirebaseConfig.fromJson(Map<String, dynamic> json) {
    apiKey = json['apiKey'] as String;
    authDomain = json['authDomain'] as String;
    projectId = json['projectId'] as String;
    storageBucket = json['storageBucket'] as String;
    messagingSenderId = json['messagingSenderId'] as String;
    appId = json['appId'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiKey'] = apiKey;
    data['authDomain'] = authDomain;

    data['projectId'] = projectId;
    data['storageBucket'] = storageBucket;
    data['messagingSenderId'] = messagingSenderId;
    data['appId'] = appId;
    return data;
  }
}
