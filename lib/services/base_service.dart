class BaseService {
  bool isInit = false;

  init() {
    if (isInit) {
      return;
    }
    isInit = true;
  }

  requireInit() async {
    if (!isInit) {
      await init();
    }
  }
}
