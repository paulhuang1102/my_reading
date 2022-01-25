class BaseService {
  bool isInit = false;

  init() {
    isInit = true;  
  }

  requireInit() async {
    if (!isInit) {
      await init();
    }
  }
}