// To parse this JSON data, do
//
//     final webSiteModel = webSiteModelFromJson(jsonString);

import 'dart:convert';

WebSiteModel webSiteModelFromJson(String str) => WebSiteModel.fromJson(json.decode(str));

String webSiteModelToJson(WebSiteModel data) => json.encode(data.toJson());

class WebSiteModel {
  WebSiteModel({
    this.ok,
    this.result,
  });

  bool ok;
  Result result;

  factory WebSiteModel.fromJson(Map<String, dynamic> json) => WebSiteModel(
    ok: json["ok"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.code,
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  });

  String code;
  String shortLink;
  String fullShortLink;
  String shortLink2;
  String fullShortLink2;
  String shareLink;
  String fullShareLink;
  String originalLink;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["code"],
    shortLink: json["short_link"],
    fullShortLink: json["full_short_link"],
    shortLink2: json["short_link2"],
    fullShortLink2: json["full_short_link2"],
    shareLink: json["share_link"],
    fullShareLink: json["full_share_link"],
    originalLink: json["original_link"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "short_link": shortLink,
    "full_short_link": fullShortLink,
    "short_link2": shortLink2,
    "full_short_link2": fullShortLink2,
    "share_link": shareLink,
    "full_share_link": fullShareLink,
    "original_link": originalLink,
  };
}
