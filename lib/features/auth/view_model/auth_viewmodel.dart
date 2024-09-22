import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String? _selectedDateOfBirth;
  get selectedDateOfBirth => _selectedDateOfBirth;
  setSelectedDateOfBirth(value) {
    _selectedDateOfBirth = value;
    validateBasicDetails();
    notifyListeners();
  }

  // Height
  List<String> heightList = ["4ft 5in", "5ft 7in", "6ft 2in"];
  String? selectedHeight;
  void updateSelectedHeight(String height) {
    selectedHeight = height;
    validateBasicDetails();
    notifyListeners();
  }

  // Address structure using a nested map
  final Map<String, Map<String, List<String>>> addressData = {
    'USA': {
      'California': ["Los Angeles", "San Francisco", "San Diego"],
      'Texas': ["Houston", "Dallas", "Austin"],
      'New York': ["New York City", "Buffalo", "Rochester"],
    },
    'India': {
      'Maharashtra': ["Mumbai", "Pune", "Nagpur"],
      'Gujarat': ["Ahmedabad", "Surat", "Vadodara"],
      'Punjab': ["Ludhiana", "Amritsar", "Jalandhar"],
    },
    'Canada': {
      'Ontario': ["Toronto", "Ottawa", "Mississauga"],
      'Quebec': ["Montreal", "Quebec City", "Laval"],
      'British Columbia': ["Vancouver", "Victoria", "Surrey"],
    },
  };
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


  bool _isLivedWithFamily = false;
  get isLivedWithFamily => _isLivedWithFamily;

  setIsLivedWithFamily(value) {
    _isLivedWithFamily = value;
    notifyListeners();
  }

//Socia Data
  List<String> maritalStatusList = ['Single', 'Married', 'Divorced', 'Widowed'];
  String? selectedMaritalStatus;

  // Other properties and methods...

  void updateSelectedMaritalStatus(String status) {
    selectedMaritalStatus = status;
    validateSocialDetails();
    notifyListeners(); // Notify listeners to update the UI
  }

//Mother toung
  List<String> motherTongueList = ['Hindi', 'English', 'Spanish', 'Mandarin'];
  String? selectedMotherTongue;
  void updateSelectedMotherTongue(String tongue) {
    selectedMotherTongue = tongue;
    validateSocialDetails();
    notifyListeners();
  }

  //Anual Income
  List<String> annualIncomeRangeList = [
    'Rs. 2-3 Lakh',
    'Rs. 3-5 Lakh',
    'Rs. 5-10 Lakh',
    'Above Rs. 10 Lakh',
  ];
  String? selectedAnnualIncomeRange;

  void updateSelectedAnnualIncomeRange(String range) {
    selectedAnnualIncomeRange = range;
    validateSocialDetails();
    notifyListeners();
  }

  //Full cast
  // Simplified map for sects and castes
  final Map<String, List<String>> sectData = {
    'Sunni': ['Hanafi', 'Maliki', 'Shafi', 'Hanbali'],
    'Shia': ['Twelver', 'Ismaili', 'Zaidi'],
    'Arab': ['Arab Sunni', 'Arab Shia'],
  };

  String? selectedSect;
  String? selectedCaste;

  String? fullCast;

  void updateSelectedSect(String sect) {
    selectedSect = sect;
    selectedCaste = null; // Reset caste when sect changes
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
  //Education

  // Education structure using a nested map
  final Map<String, List<String>> educationData = {
    'Undergraduate': [
      'B.Tech in Computer Science',
      'B.Sc',
      'B.Com',
    ],
    'Postgraduate': [
      'M.Tech in Computer Science',
      'M.Sc',
      'M.Com',
      'MBA',
    ],
    'Doctorate': [
      'Ph.D. in Computer Science',
      'Ph.D. in Mathematics',
    ],
  };

  String? selectedEducationLevel;
  String? selectedEducation;
  String? fullEducation;

  void updateSelectedEducationLevel(String level) {
    selectedEducationLevel = level;
    selectedEducation = null; // Reset the selected education when level changes
    fullEducation = null; // Reset fullEducation
    notifyListeners();
  }

  void updateSelectedEducation(String education) {
    selectedEducation = education;
    fullEducation = "$selectedEducationLevel: $education";
    validateSocialDetails();
    notifyListeners();
  }

  List<String> getEducationListForLevel(String level) {
    return educationData[level] ?? [];
  }

  //Employement
  // Employment data structure
  final Map<String, List<String>> employmentData = {
    'Employed': ['Full-time', 'Part-time', 'Contract'],
    'Unemployed': [],
    'Self-employed': ['Freelancer', 'Business Owner'],
    'Student': ['Intern', 'Full-time Student'],
  };

  String? selectedEmploymentType;
  String? selectedEmploymentDetail;

  // Full employment representation
  String? fullEmployment;

  // Method to update selected employment type
  void updateSelectedEmploymentType(String type) {
    selectedEmploymentType = type;
    fullEmployment = type; // Set fullEmployment to the selected type
    selectedEmploymentDetail = null; // Reset detail when type changes
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
  final Map<String, List<String>> occupationData = {
    'Professional': ['Doctor', 'Engineer', 'Teacher'],
    'Business': ['Entrepreneur', 'Shop Owner', 'Consultant'],
    'Government': ['Civil Servant', 'Police', 'Military'],
    'Student': ['Undergraduate', 'Graduate', 'Postgraduate'],
  };

  String? selectedOccupationType;
  String? selectedOccupationDetail;

  // Full occupation representation
  String? fullOccupation;

  // Method to update selected occupation type
  void updateSelectedOccupationType(String type) {
    selectedOccupationType = type;
    fullOccupation = type; // Set fullOccupation to the selected type
    selectedOccupationDetail = null; // Reset detail when type changes
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
