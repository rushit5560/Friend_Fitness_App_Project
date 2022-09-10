class ApiUrl {

  static const apiMainPath = "https://squadgame.omdemo.co.in/";

  /// Login, Signup
  static const signUpApi = apiMainPath + "api/registeruser";
  static const loginApi = apiMainPath + "api/login";

  /// profile
  static const getProfileApi = apiMainPath + "api/profileget/";
  static const updateProfileApi = apiMainPath + "api/profile";

  /// Change Password
  static const changePasswordApi = apiMainPath + "api/chnagepassword";

  /// Add Point wise Category
  static const addPositivePointApi = apiMainPath + "api/positivepointadd";
  static const addNegativePointApi = apiMainPath + "api/negativepointadd";

  /// Add water intake Point wise Category
  static const addWaterIntakePositivePointApi = apiMainPath + "api/waterpointadd";

  /// Get Positive Category
  static const getAllPositiveCategoryApi = apiMainPath + "api/positivecategory";

  /// Get Negative Category
  static const getAllNegativeCategoryApi = apiMainPath + "api/negativecategory";

  /// Get All Group(Game)
  static const getAllGameApi = apiMainPath + "api/game";

  /// Get User wise Point(Game Summary)
  static const getAllUserWisePointApi = apiMainPath + "api/todaypoint/";

  /// Create Game
  static const createGameApi = apiMainPath + "api/gameinsert";

  /// LeaderBoard (Show All Members)
  static const gameMemberApi = apiMainPath + "api/gamemember/";

  /// Member Join Game
  static const memberJoinGameApi = apiMainPath + "api/gamememberadd";

  /// Start Game
  static const startGameApi = apiMainPath + "api/startgame";

  /// End Game
  static const endGameApi = apiMainPath + "api/endgame";

  /// Forgot Password
  static const forgotPasswordApi = apiMainPath + "api/forgetpasswrod";
  static const verifyOtpApi = apiMainPath + "api/forgetpasswordotp";
  static const resetPasswordApi = apiMainPath + "api/forgetpasswordrest";

  /// Add star point
  static const addStarPointApi = apiMainPath + "api/starpointadd";

  /// send message and Get message
  static const sendMessageApi = apiMainPath + "api/sendmeassage";
  static const getAllMessageApi = apiMainPath + "api/messageall";

  /// Winner Member
  static const winnerMemberApi = apiMainPath + "api/wingame";
}
