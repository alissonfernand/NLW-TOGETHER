class HomeController {
  int _currentPage = 0;

  get currentPage => _currentPage;

  void setCurrentPage(int index) {
    _currentPage = index;
  }
}
