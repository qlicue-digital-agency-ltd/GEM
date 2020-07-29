import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:gem/api/api.dart';
import 'package:gem/models/Menu.dart';
import 'package:gem/models/adds.dart';
import 'package:gem/models/answer.dart';
import 'package:gem/models/case.dart';
import 'package:gem/models/category.dart';
import 'package:gem/models/comment.dart';
import 'package:gem/models/district.dart';
import 'package:gem/models/education.dart';
import 'package:gem/models/filters.dart';
import 'package:gem/models/job.dart';
import 'package:gem/models/profession.dart';
import 'package:gem/models/profile.dart';
import 'package:gem/models/repos/adds_repository.dart';
import 'package:gem/models/repos/case_repository.dart';
import 'package:gem/models/repos/comments_repository.dart';
import 'package:gem/models/repos/job_repository.dart';
import 'package:gem/models/repos/menu_repository.dart';
import 'package:gem/models/repos/tip_repository.dart';
import 'package:gem/models/repos/trade_repository.dart';
import 'package:gem/models/tip.dart';
import 'package:gem/models/trade.dart';
import 'package:gem/models/user.dart';
import 'package:gem/service/shared/shared_pref.dart';
import 'package:gem/util/util.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

mixin ConnectedGemModel on Model {
  /// Shared preference DB
  SharedPref _sharedPref = SharedPref();

  Filters _choiceFilters;

  File _pickedImage;
  User _authenticatedUser;

  bool _isFirstTab = true;
  bool _isSelectedProf = false;
  bool _onBoardingCompleted = false;
  int _indexTopTab = 0;

  List<Trade> _availableTrade;
  List<Case> _availableCase;
  List<Tip> _availableTips;
  List<Adds> _availableAdds;
  List<Job> _availableJobs;
  List<Cats> _availableCategory;
  List<User> _availableUsers;
  List<User> _searchedUsers;

  List<Menu> _availableMenu;
  List<Comment> _availableComments;
  List<Education> _availableEducationLevels;
  List<District> _availableDistricts;
  List<Profession> _availableProfessionLevels;

  bool _isSubmitingUserData = false;

  bool _isPeronalDetailsRequired = true;
  bool _showSubmitFloatingButton = false;
  bool _isSubmitDissabled = true;

  bool _isChoiceRequired = true;

  bool _doIhaveFriends = false;

  List<CategoryItem> _categoryItem = [];

  Filters get getChoiceFilters => _choiceFilters;
}

mixin UtilityModel on ConnectedGemModel {
  File file;

  Education _selectedEducationLevel;

  int _currentWizardIndex = -1;

  District _selectedDistrict;

  Profession _selectedProfessionLevel;

  List<Answer> _religionList = religionList;
  List<Answer> _ageList = ageList;
  List<Answer> _heightList = heightList;
  List<Answer> _educationList = educationList;
  List<Answer> _jobsList = jobsList;
  List<Answer> _raceList = raceList;

  List<Answer> get availableReligionList => _religionList;
  List<Answer> get availableAgeList => _ageList;
  List<Answer> get availableHeightList => _heightList;
  List<Answer> get availableEducationList => _educationList;
  List<Answer> get availableJobsList => _jobsList;
  List<Answer> get availableRaceList => _raceList;
  int get currentWizardIndex => _currentWizardIndex;

  bool checkForSelection() {
    bool _isSelected = false;

    return _isSelected;
  }

  ///setter
  ///
  set setCurrentWizardIndex(index) {
    _currentWizardIndex = index;
    notifyListeners();
  }

  ///setter
  ///
  set setPreferredReligion(id) {
    bool _status =
        !_religionList.firstWhere((religion) => religion.id == id).isSelected;
    _religionList.forEach((religion) {
      if (religion.id == id) {
        religion.isSelected = _status;
      } else {
        religion.isSelected = false;
      }
    });
    notifyListeners();
  }

  set setPreferredAge(id) {
    bool _status = !_ageList.firstWhere((age) => age.id == id).isSelected;
    _ageList.forEach((age) {
      if (age.id == id) {
        age.isSelected = _status;
      } else {
        age.isSelected = false;
      }
    });
    notifyListeners();
  }

  set setPreferredHeight(id) {
    bool _status =
        !_heightList.firstWhere((height) => height.id == id).isSelected;
    _heightList.forEach((height) {
      if (height.id == id) {
        height.isSelected = _status;
      } else {
        height.isSelected = false;
      }
    });
    notifyListeners();
  }

  set setPreferredEducation(id) {
    bool _status = !_educationList
        .firstWhere((education) => education.id == id)
        .isSelected;
    _educationList.forEach((education) {
      if (education.id == id) {
        education.isSelected = _status;
      } else {
        education.isSelected = false;
      }
    });
    notifyListeners();
  }

  set setPreferredJobs(id) {
    bool _status = !_jobsList.firstWhere((job) => job.id == id).isSelected;
    _jobsList.forEach((job) {
      if (job.id == id) {
        job.isSelected = _status;
      } else {
        job.isSelected = false;
      }
    });
    notifyListeners();
  }

  set setPreferredRace(id) {
    bool _status = !_raceList.firstWhere((race) => race.id == id).isSelected;
    _raceList.forEach((race) {
      if (race.id == id) {
        race.isSelected = _status;
      } else {
        race.isSelected = false;
      }
    });
    notifyListeners();
  }

//setter
  void selectEducationLevel(Education education) {
    _selectedEducationLevel = education;
    notifyListeners();
  }

//setter
  void selectDistrict(District district) {
    _selectedDistrict = district;
    notifyListeners();
  }

  void selectProfessionLevel(Profession profession) {
    _isSelectedProf = true;
    _selectedProfessionLevel = profession;
    _availableProfessionLevels.forEach((professionData) {
      if (profession.id == professionData.id)
        profession.isSelected = !profession.isSelected;
    });
    notifyListeners();
  }

  void setOnBoardingCompleted({@required bool status}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoardingCompleted', status);
    _onBoardingCompleted = status;
    notifyListeners();
  }

  void getOnBoardingStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _status = prefs.getBool('onBoardingCompleted');
    if (_status != null) {
      _onBoardingCompleted = _status;
    } else {
      _onBoardingCompleted = false;
    }

    notifyListeners();
  }

//getter
  Education get selectedEducationLevel => _selectedEducationLevel;
  Profession get selectedProfessionLevel => _selectedProfessionLevel;
  District get selectedDistrict => _selectedDistrict;
  bool get onBoardingCompleted => _onBoardingCompleted;

  void chooseAmImage() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    _pickedImage = file;
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  //get the choosen Image.

  File get pickedImage {
    return _pickedImage;
  }

  bool get isSubmitingUserData => _isSubmitingUserData;

  bool get isFirstTab {
    return _isFirstTab;
  }

  bool get isSubmitDissabled => _isSubmitDissabled;

  int get indexTopTab {
    return _indexTopTab;
  }

  //setters
  void setActiveTab(bool currentTabIndex) {
    _isFirstTab = currentTabIndex;
    notifyListeners();
  }

  void setTopTab(int currentTabIndex) {
    _indexTopTab = currentTabIndex;
    notifyListeners();
  }

  void setSubmitDissabledButton({@required bool status}) {
    _isSubmitDissabled = status;
    notifyListeners();
  }

  Future<void> setCategory({@required CategoryItem newCategoryItem}) async {
    int _index = _categoryItem.indexWhere((cat) => cat == newCategoryItem);

    if (_index == -1) {
      _categoryItem.add(newCategoryItem);
    }
    notifyListeners();
  }

  List<CategoryItem> get categoryItem => _categoryItem;

  // fetch all education Levels
  Future<void> fetchEducationLevels() async {
    final List<Education> _fetchedEducationLevels = [];
    try {
      final http.Response response = await http.get(api + "educations");

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        data['education'].forEach((educationData) {
          final educationLevel = Education.fromMap(educationData);

          _fetchedEducationLevels.add(educationLevel);
        });
      } else {}
    } catch (error) {
      print(error);
    }
    _availableEducationLevels = _fetchedEducationLevels;
    _selectedEducationLevel = _availableEducationLevels[0];

    notifyListeners();
  }

  // fetch all districts Levels
  Future<void> fetchDistricts() async {
    final List<District> _fetchedDistricts = [];
    try {
      final http.Response response = await http.get(api + "districts");

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        data['districts'].forEach((districtData) {
          final district = District.fromMap(districtData);

          _fetchedDistricts.add(district);
        });
      } else {}
    } catch (error) {
      print('ppppppppppppppppppppppppppppppppppppppp');
      print(error);
    }

    _availableDistricts = _fetchedDistricts;
    _selectedDistrict = _availableDistricts[0];

    notifyListeners();
  }

  ///get Education Levels..
  List<Education> get availableEducationLevels =>
      List.from(_availableEducationLevels);

  ///get Districts Levels..
  List<District> get availableDistricts => List.from(_availableDistricts);

  // fetch all profession Levels
  Future<void> fetchProfessionLevels() async {
    final List<Profession> _fetchedProfessionLevels = [];
    try {
      final http.Response response = await http.get(api + "professions");

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        data['professions'].forEach((professionData) {
          final professionLevel = Profession.fromMap(professionData);

          _fetchedProfessionLevels.add(professionLevel);
        });
      } else {}
    } catch (error) {}
    _availableProfessionLevels = _fetchedProfessionLevels;
    _selectedProfessionLevel = _availableProfessionLevels[0];

    notifyListeners();
  }

  ///get Profession Levels..
  List<Profession> get availableProfessionLevels =>
      List.from(_availableProfessionLevels);

  //profession selection
  bool get isSelectedProf => _isSelectedProf;
}

mixin TipsModel on ConnectedGemModel {
  //all tips
  List<Tip> getTips() {
    if (_availableTips == null) {
      return <Tip>[];
    }

    return List<Tip>.from(_availableTips);
  }

  void loadTips() {
    _availableTips = TipsRepository.loadTips();
    notifyListeners();
  }

  void likeTipToggle({@required tipId}) {
    int index = _availableTips.indexWhere((w) => w.id == tipId);
    final updatedTip = Tip(
      id: _availableTips[index].id,
      image: _availableTips[index].image,
      subtitle: _availableTips[index].subtitle,
      time: _availableTips[index].time,
      title: _availableTips[index].title,
      adds: _availableTips[index].adds,
      author: _availableTips[index].author,
      paragraphs: _availableTips[index].paragraphs,
      likeStatus: !_availableTips[index].likeStatus,
    );
    _availableTips[index] = updatedTip;
    notifyListeners();
  }

  //fetch tips..
  Future<void> fetchTips() async {
    final List<Tip> _fetchTips = [];
    try {
      final http.Response response = await http.get(api + 'tips');
      final Map<String, dynamic> data = json.decode(response.body);
      data['data'].forEach((_tipsData) {
        final _tip = Tip.fromMap(_tipsData);
        _fetchTips.add(_tip);
      });
    } catch (error) {
      print(error);
    }
  }
}
mixin CasesModel on ConnectedGemModel {
  //all Cases
  List<Case> getCases() {
    if (_availableCase == null) {
      return <Case>[];
    }

    return List<Case>.from(_availableCase);
  }

  void loadCases() {
    _availableCase = CaseRepository.loadCases();
    notifyListeners();
  }

  void likeCaseToggle({@required caseId}) {
    int index = _availableCase.indexWhere((w) => w.id == caseId);

    int likeCount = _availableCase[index].likes;

    if (_availableCase[index].likeStatus) {
      likeCount--;
    } else {
      likeCount++;
    }
    final updatedCase = Case(
      id: _availableCase[index].id,
      image: _availableCase[index].image,
      body: _availableCase[index].body,
      subtitle: _availableCase[index].subtitle,
      time: _availableCase[index].time,
      title: _availableCase[index].title,
      adds: _availableCase[index].adds,
      author: _availableCase[index].author,
      paragraphs: _availableCase[index].paragraphs,
      likeStatus: !_availableCase[index].likeStatus,
      likes: likeCount,
    );
    _availableCase[index] = updatedCase;
    notifyListeners();
  }
}
mixin TradeModel on ConnectedGemModel {
  //all trades
  List<Trade> getTrades() {
    if (_availableTrade == null) {
      return <Trade>[];
    }

    return List<Trade>.from(_availableTrade);
  }

  void loadTrades() {
    _availableTrade = TradeRepository.loadTrade();
    notifyListeners();
  }
}

mixin AddsModel on ConnectedGemModel {
  //all Adds
  List<Adds> getAdds() {
    if (_availableAdds == null) {
      return <Adds>[];
    }

    return List<Adds>.from(_availableAdds);
  }

  void loadAdds() {
    _availableAdds = AddsRepository.loadAdds();
    notifyListeners();
  }
}

mixin JobsModel on ConnectedGemModel {
  //all Jobs
  List<Job> getJobs() {
    if (_availableJobs == null) {
      return <Job>[];
    }

    return List<Job>.from(_availableJobs);
  }

  void loadJobs() {
    _availableJobs = JobsRepository.loadJobs();
    notifyListeners();
  }
}

mixin RelationshipModel on ConnectedGemModel {
  bool get isPeronalDetailsRequired {
    return _isPeronalDetailsRequired;
  }

  bool get isChoiceRequired {
    return _isChoiceRequired;
  }

  bool get doIhaveFriends {
    return _doIhaveFriends;
  }

  void setDoIhaveFriends({@required bool status}) {
    _doIhaveFriends = status;
    notifyListeners();
  }

  void setChoiceRequired({@required bool status}) {
    _isChoiceRequired = status;
    _showSubmitFloatingButton = status;
    notifyListeners();
  }

  void resetPersonalFormData({@required bool status}) {
    _isPeronalDetailsRequired = status;
    notifyListeners();
  }
}

mixin CatsModel on ConnectedGemModel {
  //all choices
  List<Cats> getCats() {
    if (_availableCategory == null) {
      return <Cats>[];
    }
    return List<Cats>.from(_availableCategory);
  }

  List<User> getAllUsers() {
    if (_availableUsers == null) {
      return <User>[];
    }

    return List<User>.from(_availableUsers
        .where((User user) => user.profile != null && user.id != 1));
  }

  List<User> get searchedUsers => _searchedUsers;

  void loadCats() {
    _availableCategory = categories;
    notifyListeners();
  }

  void selectCategory({@required catIndex, @required subIndex}) {
    int index = _availableCategory.indexWhere((w) => w.id == catIndex);

    _availableCategory[index].subcats[subIndex].isSelected =
        !_availableCategory[index].subcats[subIndex].isSelected;
    _availableCategory[index].isTapped = true;

    notifyListeners();
  }

  bool get showSubmitFloatingButton {
    return _showSubmitFloatingButton;
  }
}

mixin ChatModel on ConnectedGemModel {}

mixin MenuModel on ConnectedGemModel {
  //all menu
  List<Menu> getMenu() {
    if (_availableMenu == null) {
      return <Menu>[];
    }

    return List<Menu>.from(_availableMenu);
  }

  void loadMenu() {
    _availableMenu = MenuRepository.loadMenu();

    notifyListeners();
  }

  void selecteMenu({@required int menuId}) {
    int index = _availableMenu.indexWhere((w) => w.id == menuId);

    final _menu = Menu(
        id: menuId,
        type: _availableMenu[index].type,
        title: _availableMenu[index].title,
        constant: _availableMenu[index].constant,
        icon: _availableMenu[index].icon,
        isSelected: true);

    _availableMenu.add(_menu);
    notifyListeners();
  }
}

mixin CommentModel on ConnectedGemModel {
  //all comments
  List<Comment> getComments({@required int caseId}) {
    if (_availableComments == null) {
      return <Comment>[];
    }

    return _availableComments
        .where((Comment comment) => comment.caseId == caseId)
        .toList();
  }

//load comments..
  void loadComments() {
    _availableComments = CommentsRepository.loadComments();
    notifyListeners();
  }

  void sendComment({
    @required String content,
    @required String avatar,
    @required int caseId,
  }) {
    int _chatIndex = _availableComments.last.id + 1;
    final _comment = Comment(
      id: _chatIndex,
      avatar: avatar,
      content: content,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      caseId: caseId,
    );

    _availableComments.add(_comment);
    notifyListeners();
  }
}

mixin LoginModel on ConnectedGemModel {}

mixin UserModel on ConnectedGemModel {
  PublishSubject<bool> _userSubject = PublishSubject();

  Country _selectedCountry = Country.TZ;

  Country get selectedCountry => _selectedCountry;

  set setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }
//auto authenication

  Future<void> autoAuthenticate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    if (token != null) {
      final int userId = prefs.getInt('id');
      final String phone = prefs.getString('phone');
      final bool hasProfile = prefs.getBool('hasProfile');
      _authenticatedUser = User(
          id: userId,
          profile: null,
          followers: [],
          followings: [],
          phone: phone,
          token: token,
          hasProfile: hasProfile);

      _userSubject.add(true);
    }

    notifyListeners();
  }

//Sign out
  Future<void> signOut() async {
    _userSubject.add(false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('token');
    prefs.remove('phone');
    prefs.remove('hasProfile');
    notifyListeners();
  }

//sign in user
  Future<void> signInUser(
      {@required String phone, @required String password}) async {
    notifyListeners();

    final Map<String, dynamic> authData = {
      'phone': phone,
      'password': password,
    };
    final http.Response response = await http.post(
      api + "login",
      body: json.encode(authData),
      headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);

    _authenticatedUser = User.fromMap(responseData);

    _userSubject.add(true);

    _saveUserDataOnSharedPreference(responseData: responseData);

    notifyListeners();
  }

//sign in user
  Future<bool> signUpUser(
      {@required String phone, @required String password}) async {
    bool _isSiginingUp = false;

    final Map<String, dynamic> authData = {
      'phone': phone,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        api + "create",
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('token')) {
        _authenticatedUser = User.fromMap(responseData);

        _userSubject.add(true);

        _saveUserDataOnSignUpOnSharedPreference(responseData: responseData);
        _isSiginingUp = true;
      } else {
        _isSiginingUp = false;
      }
    } catch (e) {
      print(e);
      _isSiginingUp = false;
    }

    notifyListeners();
    return _isSiginingUp;
  }

  _saveUserDataOnSharedPreference(
      {@required Map<String, dynamic> responseData}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', responseData['id']);
    prefs.setString('token', responseData['token']);
    prefs.setString('phone', responseData['phone'].toString());
    if (responseData['profile'] != null) {
      prefs.setBool('hasProfile', true);
    } else {
      prefs.setBool('hasProfile', false);
    }
  }

  _saveUserDataOnSignUpOnSharedPreference(
      {@required Map<String, dynamic> responseData}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', responseData['id']);
    prefs.setString('token', responseData['token']);
    prefs.setString('phone', responseData['phone'].toString());
    prefs.setBool('hasProfile', false);
  }

  // post  Profile.
  Future<bool> postPofile(
      {@required String firstName,
      @required String lastName,
      @required String sex,
      @required String birthday,
      @required String matrialStatus,
      @required Education educationLevel,
      @required Profession profession,
      @required District pronvice,
      @required String nationality,
      @required String dominion,
      @required String skinColor,
      @required String height,
      @required String bio}) async {
    _isSubmitingUserData = false;
    bool hasError = false;

    notifyListeners();

    Dio dio = new Dio();
    dio.options.headers = {
      'Content-type': 'multipart/form-data',
      'Accept': 'application/json'
    };

    FormData formData = new FormData.fromMap({
      "first_name": firstName,
      "last_name": lastName,
      "sex": sex,
      "birthday": birthday,
      "marital_status": matrialStatus,
      "education_id": educationLevel.id,
      "profession_id": profession.id,
      "education": educationLevel.level,
      "profession": profession.description,
      "pronvice": pronvice.name,
      "nationality": nationality,
      "bio": bio,
      "dominion": dominion,
      "skin_color": skinColor,
      "height": height,
      "file": await MultipartFile.fromFile(_pickedImage.path,
          filename: "upload.png"),
    });


    await dio
        .post(api + "profile/" + _authenticatedUser.id.toString(),
            data: formData,
            options: Options(
                method: 'POST',
                responseType: ResponseType.json // or ResponseType.JSON
                ))
        .then((response) {
      final Map<String, dynamic> data = response.data;

      if (response.statusCode == 200) {
        hasError = false;

        print(data['profile']);
        _authenticatedUser.profile = Profile.fromMap(data['profile']);
        _authenticatedUser.hasProfile = true;

        _updateProfileStatus();

        _userSubject.add(true);
        resetImage();
        notifyListeners();
        //// move to the next page
      } else {
        hasError = true;
      }
    }).catchError((error) {
      hasError = true;
      print(error);
    });

    _isSubmitingUserData = false;

    return hasError;
  }

  // fetch all users...
  Future<void> fetchUserProfile() async {
    try {
      final http.Response response = await http
          .get(api + "userProfile/" + _authenticatedUser.id.toString());

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        _authenticatedUser.profile = Profile.fromMap(data['profile']);
        _authenticatedUser.hasProfile = true;
      } else {}
    } catch (error) {
      print(error);
    }

    notifyListeners();
  }

  // fetch all users...
  Future<void> fetchAllUsers() async {
    final List<User> _fetchedUsers = [];
    try {
      final http.Response response = await http.get(api + "users");

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        data['users'].forEach((userData) {
          final _users = User.fromMap(userData);

          _fetchedUsers.add(_users);
        });
      } else {}
    } catch (error) {
      print(error);
    }
    _availableUsers =
        List.from(_fetchedUsers.where((user) => user.profile != null));

    notifyListeners();
  }

//
  void _updateProfileStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasProfile', true);
  }

//public methods
  void resetImage() {
    _pickedImage = null;
    notifyListeners();
  }

  //getters
  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  User get authenticatedUser => _authenticatedUser;

  Future<void> loadFilters() async {
    try {
      Filters _filters = Filters.fromMap(await _sharedPref.read("filters"));

      _choiceFilters = _filters;
      notifyListeners();
    } catch (err) {}
  }

  Future<void> filterUsers(
      {@required race,
      @required religion,
      @required age,
      @required height,
      @required education,
      @required employment,
      @required sex}) async {
    ///filters.....
    final _filter = Filters(
        race: race,
        religion: religion,
        age: age,
        height: height,
        education: education,
        employment: employment,
        sex: sex);

    _sharedPref.save('filters', _filter.toMap());

    String emp = "";
    if (employment == 'a') {
      emp = "employeed";
    } else {
      emp = "non";
    }

    int _ageLow = 0;
    int _ageHigh = 0;
    switch (age) {
      case 'A':
        _ageLow = 18;
        _ageHigh = 24;
        break;
      case 'B':
        _ageLow = 25;
        _ageHigh = 34;
        break;
      case 'C':
        _ageLow = 35;
        _ageHigh = 44;
        break;
      case 'D':
        _ageLow = 45;
        _ageHigh = 54;
        break;
      case 'E':
        _ageLow = 55;
        _ageHigh = 64;
        break;
      case 'F':
        _ageLow = 65;
        _ageHigh = 100;
        break;
      default:
    }

    _searchedUsers = List<User>.from(_availableUsers.where((user) =>
        (user.profile.education.toLowerCase() == education &&
            user.profile.profession != emp &&
            user.profile.skinColor.toLowerCase() == race &&
            user.profile.dominion.toLowerCase() == religion &&
            user.profile.height.toLowerCase() == height &&
            _getAge(user.profile.birthday) >= _ageLow &&
            _getAge(user.profile.birthday) <= _ageHigh) &&
        user.profile.sex.toLowerCase() == sex));

    notifyListeners();
  }

  int _getAge(String bday) {
    final birthday = DateTime.parse(bday);
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays / 365;
    return difference.round();
  }
}
