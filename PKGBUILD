pkgname=rubbish
pkgver=0.1.0
pkgrel=0
license=('CC0-1.0')
arch=(any)
depends=(fish)

package() {
  cd ..

  install -Dm755 git-test.fish  "$pkgdir/usr/bin/git-test"
  install -Dm755 musicdl.sh     "$pkgdir/usr/bin/musicdl"
  install -Dm755 rfetch.fish    "$pkgdir/usr/bin/rfetch"
  install -Dm755 spdx.sh        "$pkgdir/usr/bin/spdx"
  install -Dm755 sudo.fish      "$pkgdir/usr/bin/sudo"

  install -Dm644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/rubbish.fish"
}
