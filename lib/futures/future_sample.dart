class FutureSample {
  Future<bool> _isAuthorized;

  void test() {
    _isAuthorized = _isUserValid();
  }

  void login() async {
    _isUserValid().then((bool result) {
      if (!result) {
        _authorizeUser();
      }
    }, onError: (error) => print(error));
  }

  Future<bool> _isUserValid() async {
    return false;
  }

  void _authorizeUser() async {}
}
