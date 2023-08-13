class VdDetails{
  final id, site;
  VdDetails({
        this.id,
        this.site
  });

  factory VdDetails.fromJson(Map<String, dynamic> json) {
    return VdDetails(
      id: json['key'] == null ? null : json['key'],
      site: json['site'] == null ? null : json['site']
    );
  }
}