#!/usr/bin/env bash

nucleus::_setup_qt() {
  unset -f nucleus::_setup_qt

  ## QT stuff (logged during `brew install qt5`):
  #echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
  #LDFLAGS:  -L/usr/local/opt/qt/lib
  #CPPFLAGS: -I/usr/local/opt/qt/include
  #PKG_CONFIG_PATH: /usr/local/opt/qt/lib/pkgconfig
  export PATH="/usr/local/opt/qt/bin:${PATH}"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
}

nucleus::_setup_qt
