class ApiUrl {

  static const apiMainPath = "https://squadgame.omdemo.co.in/";

  /// Login, Signup
  static const signUpApi = apiMainPath + "api/register";
  static const loginApi = apiMainPath + "api/login";

  /// profile
  static const getProfileApi = apiMainPath + "api/profileget/";
  static const updateProfileApi = apiMainPath + "api/profile";

  /// Change Password
  static const changePasswordApi = apiMainPath + "api/chnagepassword";

  /// Add Point wise Category
  static const addPositivePointApi = apiMainPath + "api/positivepointadd";
  static const addNegativePointApi = apiMainPath + "api/negativepointadd";

  /// Get Positive Category
  static const getAllPositiveCategoryApi = apiMainPath + "api/positivecategory";

  /// Get Negative Category
  static const getAllNegativeCategoryApi = apiMainPath + "api/negativecategory";

  /// Get All Group(Game)
  static const getAllGameApi = apiMainPath + "api/game";

  /// Get User wise Point(Game Summary)
  static const getAllUserWisePointApi = apiMainPath + "api/userpoint/";

  /// Create Game
  static const createGameApi = apiMainPath + "api/gameinsert";

  /// LeaderBoard (Show All Members)
  static const gameMemberApi = apiMainPath + "api/gamemember/";
}
