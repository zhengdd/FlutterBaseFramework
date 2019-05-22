class Config {
  static final bool TEST_ENABLED = true; //是否是测试

  //测试服务器
  static final String API_TEST_URL = "http://www.text.com/";

  //正式服务器
  static final String API_URL = "http://www.text.com/";

  static final String BaseUrl = TEST_ENABLED ? API_TEST_URL : API_URL;
}
