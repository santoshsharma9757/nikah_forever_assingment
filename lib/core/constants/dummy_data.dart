

class DummyData {
  // Height
  static const List<String> heightList = ["4ft 5in", "5ft 7in", "6ft 2in"];

  // Address data
  static const Map<String, Map<String, List<String>>> addressData = {
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

  // Marital Status
  static const List<String> maritalStatusList = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  // Mother Tongue
  static const List<String> motherTongueList = [
    'Hindi',
    'English',
    'Spanish',
    'Mandarin'
  ];

  // Annual Income
  static const List<String> annualIncomeRangeList = [
    'Rs. 2-3 Lakh',
    'Rs. 3-5 Lakh',
    'Rs. 5-10 Lakh',
    'Above Rs. 10 Lakh',
  ];

  // Sect data
  static const Map<String, List<String>> sectData = {
    'Sunni': ['Hanafi', 'Maliki', 'Shafi', 'Hanbali'],
    'Shia': ['Twelver', 'Ismaili', 'Zaidi'],
    'Arab': ['Arab Sunni', 'Arab Shia'],
  };

  // Education data
  static const Map<String, List<String>> educationData = {
    'Undergraduate': [
      'B.Tech',
      'B.Sc',
      'B.Com',
    ],
    'Postgraduate': [
      'M.Tech',
      'M.Sc',
      'M.Com',
      'MBA',
    ],
    'Doctorate': [
      'Ph.D. in Computer Science',
      'Ph.D. in Mathematics',
    ],
  };

  // Employment data
  static const Map<String, List<String>> employmentData = {
    'Employed': ['Full-time', 'Part-time', 'Contract'],
    'Unemployed': [],
    'Self-employed': ['Freelancer', 'Business Owner'],
    'Student': ['Intern', 'Full-time Student'],
  };

  // Occupation data
  static const Map<String, List<String>> occupationData = {
    'Professional': ['Doctor', 'Engineer', 'Teacher'],
    'Business': ['Entrepreneur', 'Shop Owner', 'Consultant'],
    'Government': ['Civil Servant', 'Police', 'Military'],
    'Student': ['Undergraduate', 'Graduate', 'Postgraduate'],
  };
}
