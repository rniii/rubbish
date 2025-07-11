pkgname=rubbish
pkgver=0.1.0
pkgrel=2
license=('CC0-1.0')
arch=(any)

package() {
  cd ..

  install -Dm755 git-test.sh "$pkgdir/usr/bin/git-test"
  install -Dm755 musicdl.sh  "$pkgdir/usr/bin/musicdl"
  install -Dm755 new.rb      "$pkgdir/usr/bin/new"
  install -Dm755 rfetch.sh   "$pkgdir/usr/bin/rfetch"
  install -Dm755 spdx.sh     "$pkgdir/usr/bin/spdx"
  install -Dm755 sudo.sh     "$pkgdir/usr/bin/sudo"

  install -Dm644 _spdx "$pkgdir/usr/share/zsh/site-functions/_spdx"
}
