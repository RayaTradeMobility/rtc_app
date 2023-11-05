class NewsModel {
  int? iD;
  String? headerEN;
  String? headerAR;
  String? detailsAR;
  String? detailsEN;
  int? menuID;
  String? menuName;
  int? statusID;
  String? statusName;
  String? imageAR;
  String? imageEN;
  String? attached1Path;
  String? attached2Path;
  String? attached3Path;
  String? browserLink;
  int? location;
  String? locationName;
  String? viedioPath;
  String? expiryDate;
  int? permissionID;
  String? permissionName;
  String? createdBY;
  String? createdDate;
  int? userID;
  bool? isNotification;
  bool? isNotificationRead;
  int? notReaded;
  String? complainIdeaStatusID;
  String? complainIdeaStatusName;
  bool? isSent;

  NewsModel(
      {this.iD,
      this.headerEN,
      this.headerAR,
      this.detailsAR,
      this.detailsEN,
      this.menuID,
      this.menuName,
      this.statusID,
      this.statusName,
      this.imageAR,
      this.imageEN,
      this.attached1Path,
      this.attached2Path,
      this.attached3Path,
      this.browserLink,
      this.location,
      this.locationName,
      this.viedioPath,
      this.expiryDate,
      this.permissionID,
      this.permissionName,
      this.createdBY,
      this.createdDate,
      this.userID,
      this.isNotification,
      this.isNotificationRead,
      this.notReaded,
      this.complainIdeaStatusID,
      this.complainIdeaStatusName,
      this.isSent});

  NewsModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    headerEN = json['HeaderEN'];
    headerAR = json['HeaderAR'];
    detailsAR = json['DetailsAR'];
    detailsEN = json['DetailsEN'];
    menuID = json['MenuID'];
    menuName = json['MenuName'];
    statusID = json['StatusID'];
    statusName = json['StatusName'];
    imageAR = json['ImageAR'];
    imageEN = json['ImageEN'];
    attached1Path = json['attached1_Path'];
    attached2Path = json['attached2_Path'];
    attached3Path = json['attached3_Path'];
    browserLink = json['browserLink'];
    location = json['Location'];
    locationName = json['LocationName'];
    viedioPath = json['Viedio_Path'];
    expiryDate = json['ExpiryDate'];
    permissionID = json['PermissionID'];
    permissionName = json['PermissionName'];
    createdBY = json['CreatedBY'];
    createdDate = json['CreatedDate'];
    userID = json['UserID'];
    isNotification = json['IsNotification'];
    isNotificationRead = json['IsNotification_Read'];
    notReaded = json['NotReaded'];
    complainIdeaStatusID = json['Complain_Idea_StatusID'];
    complainIdeaStatusName = json['Complain_Idea_StatusName'];
    isSent = json['IsSent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['HeaderEN'] = headerEN;
    data['HeaderAR'] = headerAR;
    data['DetailsAR'] = detailsAR;
    data['DetailsEN'] = detailsEN;
    data['MenuID'] = menuID;
    data['MenuName'] = menuName;
    data['StatusID'] = statusID;
    data['StatusName'] = statusName;
    data['ImageAR'] = imageAR;
    data['ImageEN'] = imageEN;
    data['attached1_Path'] = attached1Path;
    data['attached2_Path'] = attached2Path;
    data['attached3_Path'] = attached3Path;
    data['browserLink'] = browserLink;
    data['Location'] = location;
    data['LocationName'] = locationName;
    data['Viedio_Path'] = viedioPath;
    data['ExpiryDate'] = expiryDate;
    data['PermissionID'] = permissionID;
    data['PermissionName'] = permissionName;
    data['CreatedBY'] = createdBY;
    data['CreatedDate'] = createdDate;
    data['UserID'] = userID;
    data['IsNotification'] = isNotification;
    data['IsNotification_Read'] = isNotificationRead;
    data['NotReaded'] = notReaded;
    data['Complain_Idea_StatusID'] = complainIdeaStatusID;
    data['Complain_Idea_StatusName'] = complainIdeaStatusName;
    data['IsSent'] = isSent;
    return data;
  }
}
