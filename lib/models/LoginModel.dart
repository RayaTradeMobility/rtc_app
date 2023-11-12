// ignore_for_file: file_names

class LoginModel {
  String? company;
  String? department;
  int? grade;
  String? hiringDate;
  String? managerSHRID;
  String? depManagerSHRID;
  String? name;
  String? title;
  String? birthDate;
  String? maritalStatus;
  int? gender;
  String? address;
  String? email;
  String? portalPassword;
  String? loginName;
  String? hRID;

  LoginModel(
      {this.company,
      this.department,
      this.grade,
      this.hiringDate,
      this.managerSHRID,
      this.depManagerSHRID,
      this.name,
      this.title,
      this.birthDate,
      this.maritalStatus,
      this.gender,
      this.address,
      this.email,
      this.portalPassword,
      this.loginName,
      this.hRID});

  LoginModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      final Map<String, dynamic> data = json[0];
      company = data['Company'];
      department = data['Department'];
      grade = data['Grade'];
      hiringDate = data['Hiring_Date'];
      managerSHRID = data['Manager_s_HR_ID'];
      depManagerSHRID = data['Dep__Manager_s_HR_ID'];
      name = data['Name'];
      title = data['Title'];
      birthDate = data['Birth_Date'];
      maritalStatus = data['Marital_Status'];
      gender = data['Gender'];
      address = data['Address'];
      email = data['Email'];
      portalPassword = data['Portal_Password'];
      loginName = data['Login_Name'];
      hRID = data['HR_ID'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Company'] = company;
    data['Department'] = department;
    data['Grade'] = grade;
    data['Hiring_Date'] = hiringDate;
    data['Manager_s_HR_ID'] = managerSHRID;
    data['Dep__Manager_s_HR_ID'] = depManagerSHRID;
    data['Name'] = name;
    data['Title'] = title;
    data['Birth_Date'] = birthDate;
    data['Marital_Status'] = maritalStatus;
    data['Gender'] = gender;
    data['Address'] = address;
    data['Email'] = email;
    data['Portal_Password'] = portalPassword;
    data['Login_Name'] = loginName;
    data['HR_ID'] = hRID;
    return data;
  }
}
