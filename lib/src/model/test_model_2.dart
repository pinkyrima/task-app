class TaskModel {
  String? parentConsignmentChargesRequestOid;
  String? parentConsignmentChargeOid;
  OrderCnRequest? orderCnRequest;
  SenderInfo? senderInfo;
  List<ConsignmentChargesRequestParams>? consignmentChargesRequestParams;

  TaskModel(
      {this.parentConsignmentChargesRequestOid,
      this.parentConsignmentChargeOid,
      this.orderCnRequest,
      this.senderInfo,
      this.consignmentChargesRequestParams});

  TaskModel.fromJson(Map<String, dynamic> json) {
    parentConsignmentChargesRequestOid =
        json['parent_consignment_charges_request_oid'];
    parentConsignmentChargeOid = json['parent_consignment_charge_oid'];
    orderCnRequest = json['orderCnRequest'] != null
        ? OrderCnRequest.fromJson(json['orderCnRequest'])
        : null;
    senderInfo = json['senderInfo'] != null
        ? SenderInfo.fromJson(json['senderInfo'])
        : null;
    if (json['consignmentChargesRequestParams'] != null) {
      consignmentChargesRequestParams = <ConsignmentChargesRequestParams>[];
      json['consignmentChargesRequestParams'].forEach((v) {
        consignmentChargesRequestParams!
            .add(ConsignmentChargesRequestParams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_consignment_charges_request_oid'] =
        parentConsignmentChargesRequestOid;
    data['parent_consignment_charge_oid'] = parentConsignmentChargeOid;
    if (orderCnRequest != null) {
      data['orderCnRequest'] = orderCnRequest!.toJson();
    }
    if (senderInfo != null) {
      data['senderInfo'] = senderInfo!.toJson();
    }
    if (consignmentChargesRequestParams != null) {
      data['consignmentChargesRequestParams'] =
          consignmentChargesRequestParams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderCnRequest {
  String? cnRequestId;
  String? serviceTypeId;
  String? requestTypeId;
  String? homeDelivery;
  String? payer;
  String? paymentType;

  OrderCnRequest(
      {this.cnRequestId,
      this.serviceTypeId,
      this.requestTypeId,
      this.homeDelivery,
      this.payer,
      this.paymentType});

  OrderCnRequest.fromJson(Map<String, dynamic> json) {
    cnRequestId = json['cn_request_id'];
    serviceTypeId = json['service_type_id'];
    requestTypeId = json['request_type_id'];
    homeDelivery = json['home_delivery'];
    payer = json['payer'];
    paymentType = json['payment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cn_request_id'] = cnRequestId;
    data['service_type_id'] = serviceTypeId;
    data['request_type_id'] = requestTypeId;
    data['home_delivery'] = homeDelivery;
    data['payer'] = payer;
    data['payment_type'] = paymentType;
    return data;
  }
}

class SenderInfo {
  String? senderNameEn;
  String? senderNameBn;
  String? senderType;
  String? senderPhone;
  String? senderEmail;
  String? senderNid;
  String? senderDivisionOid;
  String? senderDistrictOid;
  String? senderThanaOid;
  String? senderPostOfficeOid;
  String? senderAddress;
  String? senderHubOid;

  SenderInfo(
      {this.senderNameEn,
      this.senderNameBn,
      this.senderType,
      this.senderPhone,
      this.senderEmail,
      this.senderNid,
      this.senderDivisionOid,
      this.senderDistrictOid,
      this.senderThanaOid,
      this.senderPostOfficeOid,
      this.senderAddress,
      this.senderHubOid});

  SenderInfo.fromJson(Map<String, dynamic> json) {
    senderNameEn = json['sender_name_en'];
    senderNameBn = json['sender_name_bn'];
    senderType = json['sender_type'];
    senderPhone = json['sender_phone'];
    senderEmail = json['sender_email'];
    senderNid = json['sender_nid'];
    senderDivisionOid = json['sender_division_oid'];
    senderDistrictOid = json['sender_district_oid'];
    senderThanaOid = json['sender_thana_oid'];
    senderPostOfficeOid = json['sender_post_office_oid'];
    senderAddress = json['sender_address'];
    senderHubOid = json['sender_hub_oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_name_en'] = senderNameEn;
    data['sender_name_bn'] = senderNameBn;
    data['sender_type'] = senderType;
    data['sender_phone'] = senderPhone;
    data['sender_email'] = senderEmail;
    data['sender_nid'] = senderNid;
    data['sender_division_oid'] = senderDivisionOid;
    data['sender_district_oid'] = senderDistrictOid;
    data['sender_thana_oid'] = senderThanaOid;
    data['sender_post_office_oid'] = senderPostOfficeOid;
    data['sender_address'] = senderAddress;
    data['sender_hub_oid'] = senderHubOid;
    return data;
  }
}

class ConsignmentChargesRequestParams {
  String? oid;
  String? parentOid;
  String? requestTypeId;
  String? serviceTypeId;
  String? categoryId;
  String? isPackaging;
  String? packagingId;
  String? isVolumetricWeight;
  String? lengthValue;
  String? widthValue;
  String? heightValue;
  String? productWeight;
  String? isDhakaCity;
  String? isOtherCity;
  String? isUpazila;
  String? homeDelivery;
  String? isCheckCod;
  String? collectableAmount;

  ConsignmentChargesRequestParams(
      {this.oid,
      this.parentOid,
      this.requestTypeId,
      this.serviceTypeId,
      this.categoryId,
      this.isPackaging,
      this.packagingId,
      this.isVolumetricWeight,
      this.lengthValue,
      this.widthValue,
      this.heightValue,
      this.productWeight,
      this.isDhakaCity,
      this.isOtherCity,
      this.isUpazila,
      this.homeDelivery,
      this.isCheckCod,
      this.collectableAmount});

  ConsignmentChargesRequestParams.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    parentOid = json['parent_oid'];
    requestTypeId = json['request_type_id'];
    serviceTypeId = json['service_type_id'];
    categoryId = json['category_id'];
    isPackaging = json['is_packaging'];
    packagingId = json['packaging_id'];
    isVolumetricWeight = json['is_volumetric_weight'];
    lengthValue = json['length_value'];
    widthValue = json['width_value'];
    heightValue = json['height_value'];
    productWeight = json['product_weight'];
    isDhakaCity = json['is_dhaka_city'];
    isOtherCity = json['is_other_city'];
    isUpazila = json['is_upazila'];
    homeDelivery = json['home_delivery'];
    isCheckCod = json['is_check_cod'];
    collectableAmount = json['collectable_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    data['parent_oid'] = parentOid;
    data['request_type_id'] = requestTypeId;
    data['service_type_id'] = serviceTypeId;
    data['category_id'] = categoryId;
    data['is_packaging'] = isPackaging;
    data['packaging_id'] = packagingId;
    data['is_volumetric_weight'] = isVolumetricWeight;
    data['length_value'] = lengthValue;
    data['width_value'] = widthValue;
    data['height_value'] = heightValue;
    data['product_weight'] = productWeight;
    data['is_dhaka_city'] = isDhakaCity;
    data['is_other_city'] = isOtherCity;
    data['is_upazila'] = isUpazila;
    data['home_delivery'] = homeDelivery;
    data['is_check_cod'] = isCheckCod;
    data['collectable_amount'] = collectableAmount;
    return data;
  }
}
