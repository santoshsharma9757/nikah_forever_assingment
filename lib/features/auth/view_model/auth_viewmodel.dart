import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/dummy_data.dart';

class AuthViewModel extends ChangeNotifier {
  //Pageview Index
  int currentPageIndex = 0;

  //Date of Birth
  String? _selectedDateOfBirth;
  get selectedDateOfBirth => _selectedDateOfBirth;
  setSelectedDateOfBirth(value) {
    _selectedDateOfBirth = value;
    validateBasicDetails();
    notifyListeners();
  }

  // Height
  List<String> heightList = DummyData.heightList;
  String? selectedHeight;
  void updateSelectedHeight(String height) {
    selectedHeight = height;
    validateBasicDetails();
    notifyListeners();
  }

  // Address structure using a nested map
  final Map<String, Map<String, List<String>>> addressData =
      DummyData.addressData;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? fullAddress;
  String? selectedCountry2;
  String? selectedState2;
  String? selectedCity2;
  String? fullAddress2;
  void updateSelectedCountry(String country, {bool isAddress2 = false}) {
    if (isAddress2) {
      selectedCountry2 = country;
      fullAddress2 = country;
      selectedState2 = null;
      selectedCity2 = null;
    } else {
      selectedCountry = country;
      fullAddress = country;
      selectedState = null;
      selectedCity = null;
    }
    notifyListeners();
  }

  void updateSelectedState(String state, {bool isAddress2 = false}) {
    if (isAddress2) {
      selectedState2 = state;
      fullAddress2 = "$fullAddress2, $state";
      selectedCity2 = null;
    } else {
      selectedState = state;
      fullAddress = "$fullAddress, $state";
      selectedCity = null;
    }
    notifyListeners();
  }

  void updateSelectedCity(String city, {bool isAddress2 = false}) {
    if (isAddress2) {
      selectedCity2 = city;
      fullAddress2 = "$fullAddress2, $city";
    } else {
      selectedCity = city;
      fullAddress = "$fullAddress, $city";
    }
    validateBasicDetails();
    notifyListeners();
  }

  List<String> getStateListForCountry(String country,
      {bool isAddress2 = false}) {
    return addressData[country]?.keys.toList() ?? [];
  }

  List<String> getCityListForState(String state, {bool isAddress2 = false}) {
    String? country = isAddress2 ? selectedCountry2 : selectedCountry;
    if (country != null) {
      return addressData[country]?[state] ?? [];
    }
    return [];
  }

  List<String> get countryList => addressData.keys.toList();

  //Basic detail validation
  bool _isNameValid = true;
  bool _isDateOfBirthValid = true;
  bool _isHeightValid = true;
  bool _isAddressValid = true;
  bool _isAddress2Valid = true;
  final TextEditingController nameController = TextEditingController();
  void validateBasicDetails() {
    _isNameValid = nameController.text.isNotEmpty;
    _isDateOfBirthValid =
        selectedDateOfBirth != null && selectedDateOfBirth!.isNotEmpty;
    _isHeightValid = selectedHeight != null && selectedHeight!.isNotEmpty;
    _isAddressValid = fullAddress != null && fullAddress!.isNotEmpty;
    _isAddress2Valid = fullAddress2 != null && fullAddress2!.isNotEmpty;
    notifyListeners();
  }

  // Getters for validation
  bool get isNameValid => _isNameValid;
  bool get isDateOfBirthValid => _isDateOfBirthValid;
  bool get isHeightValid => _isHeightValid;
  bool get isAddressValid => _isAddressValid;
  bool get isAddress2Valid => _isAddress2Valid;

  bool? _isLivedWithFamily;
  get isLivedWithFamily => _isLivedWithFamily;

  void setIsLivedWithFamily(bool value) {
    _isLivedWithFamily = value;
    notifyListeners();
  }

  onSaved() {
    _isNameValid = true;
    notifyListeners();
  }

//Socia Details Section
  List<String> maritalStatusList = DummyData.maritalStatusList;
  String? selectedMaritalStatus;
  void updateSelectedMaritalStatus(String status) {
    selectedMaritalStatus = status;
    validateSocialDetails();
    notifyListeners();
  }

//Mother toung
  List<String> motherTongueList = DummyData.motherTongueList;
  String? selectedMotherTongue;
  void updateSelectedMotherTongue(String tongue) {
    selectedMotherTongue = tongue;
    validateSocialDetails();
    notifyListeners();
  }

  //Anual Income
  List<String> annualIncomeRangeList = DummyData.annualIncomeRangeList;
  String? selectedAnnualIncomeRange;
  void updateSelectedAnnualIncomeRange(String range) {
    selectedAnnualIncomeRange = range;
    validateSocialDetails();
    notifyListeners();
  }

  //Full cast
  final Map<String, List<String>> sectData = DummyData.sectData;
  String? selectedSect;
  String? selectedCaste;

  String? fullCast;

  void updateSelectedSect(String sect) {
    selectedSect = sect;
    selectedCaste = null;
    fullCast = sect;

    notifyListeners();
  }

  void updateSelectedCaste(String caste) {
    selectedCaste = caste;
    fullCast = "$selectedSect, $caste";
    validateSocialDetails();
    notifyListeners();
  }

  List<String> getCasteListForSect(String sect) {
    return sectData[sect] ?? [];
  }

  // Education structure using a nested map
  final Map<String, List<String>> educationData = DummyData.educationData;
  String? selectedEducationLevel;
  String? selectedEducation;
  String? fullEducation;
  void updateSelectedEducationLevel(String level) {
    selectedEducationLevel = level;
    selectedEducation = null;
    fullEducation = null;
    notifyListeners();
  }

  void updateSelectedEducation(String education) {
    selectedEducation = education;
    fullEducation = "$selectedEducationLevel,$education";
    validateSocialDetails();
    notifyListeners();
  }

  List<String> getEducationListForLevel(String level) {
    return educationData[level] ?? [];
  }

  // Employment data structure
  final Map<String, List<String>> employmentData = DummyData.employmentData;
  String? selectedEmploymentType;
  String? selectedEmploymentDetail;
  // Full employment representation
  String? fullEmployment;

  // Method to update selected employment type
  void updateSelectedEmploymentType(String type) {
    selectedEmploymentType = type;
    fullEmployment = type;
    selectedEmploymentDetail = null;
    notifyListeners();
  }

  // Method to update selected employment detail
  void updateSelectedEmploymentDetail(String detail) {
    selectedEmploymentDetail = detail;
    fullEmployment = "$fullEmployment, $detail";
    validateSocialDetails();
    notifyListeners();
  }

  // Method to get employment details for a specific type
  List<String> getEmploymentDetailsForType(String type) {
    return employmentData[type] ?? [];
  }

  //Occupation
  // Occupation data structure
  final Map<String, List<String>> occupationData = DummyData.occupationData;

  String? selectedOccupationType;
  String? selectedOccupationDetail;

  // Full occupation representation
  String? fullOccupation;

  // Method to update selected occupation type
  void updateSelectedOccupationType(String type) {
    selectedOccupationType = type;
    fullOccupation = type;
    selectedOccupationDetail = null;
    notifyListeners();
  }

  // Method to update selected occupation detail
  void updateSelectedOccupationDetail(String detail) {
    selectedOccupationDetail = detail;
    fullOccupation = "$fullOccupation, $detail";
    validateSocialDetails();
    notifyListeners();
  }

  // Method to get occupation details for a specific type
  List<String> getOccupationDetailsForType(String type) {
    return occupationData[type] ?? [];
  }

  // Social detail validation
  bool _isMaritalStatusValid = true;
  bool _isMotherTongueValid = true;
  bool _isCastValid = true;
  bool _isEducationValid = true;
  bool _isEmploymentValid = true;
  bool _isOccupationValid = true;
  bool _isAnnualIncomeValid = true;

  // New validation method for social details
  void validateSocialDetails() {
    _isMaritalStatusValid =
        selectedMaritalStatus != null && selectedMaritalStatus!.isNotEmpty;
    _isMotherTongueValid =
        selectedMotherTongue != null && selectedMotherTongue!.isNotEmpty;
    _isCastValid = fullCast != null && fullCast!.isNotEmpty;
    _isEducationValid = fullEducation != null && fullEducation!.isNotEmpty;
    _isEmploymentValid = fullEmployment != null && fullEmployment!.isNotEmpty;
    _isOccupationValid = fullOccupation != null && fullOccupation!.isNotEmpty;
    _isAnnualIncomeValid = selectedAnnualIncomeRange != null &&
        selectedAnnualIncomeRange!.isNotEmpty;
    notifyListeners();
  }

  // Getters for validation
  bool get isMaritalStatusValid => _isMaritalStatusValid;
  bool get isMotherTongueValid => _isMotherTongueValid;
  bool get isCastValid => _isCastValid;
  bool get isEducationValid => _isEducationValid;
  bool get isEmploymentValid => _isEmploymentValid;
  bool get isOccupationValid => _isOccupationValid;
  bool get isAnnualIncomeValid => _isAnnualIncomeValid;
}
