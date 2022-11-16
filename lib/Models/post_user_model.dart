class Postusermodel {
  String? name;
  String? job;

  Postusermodel({this.name, this.job});

  Postusermodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
  }

  get nameController => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    return data;
  }
}


