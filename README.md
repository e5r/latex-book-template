# The E5R LaTeX Book Template

O template de livro em LaTeX para o Time de Desenvolvimento E5R.

## Requisitos

* TeX Live >= 2017
  - https://www.latex-project.org
  - https://ctan.org/pkg/texlive
  - http://tug.org/texlive/
* ImageMagick >= 7.0
  - https://www.imagemagick.org

> No Linux após instalação do ImageMagick talvez seja
  necessário configurar a política de segurança para
  permitir a conversão de PNG para EPS.

```shell
sudo vi /etc/ImageMagick-6/policy.xml
```
```xml
<!-- Encontre essa linha: -->
<policy domain="coder" rights="none" pattern="EPS" />

<!-- E altere para essa: -->
<policy domain="coder" rights="read|write" pattern="EPS" />
```

## Construindo o livro

Após construído, seu livro estará pronto como `book.pdf`.

### Linux
```shell
$ ./makebook
$ ./makebook clean
```

### Windows
```shell
$ makebook
$ makebook clean
```
