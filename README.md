# The E5R LaTeX Book Template

O template de livro em LaTeX para o Time de Desenvolvimento E5R.

## Requisitos

* TeX Live >= 2017
  - https://www.latex-project.org
  - https://ctan.org/pkg/texlive
  - http://tug.org/texlive/
* ImageMagick >= 6.0
  - https://www.imagemagick.org

No Linux após instalação do ImageMagick talvez seja
necessário configurar a política de segurança para
permitir a conversão de PNG para EPS.

Para isso edite o arquivo `/etc/ImageMagick-6/policy.xml`:
```xml
<!-- Encontre essa linha: -->
<policy domain="coder" rights="none" pattern="EPS" />

<!-- E substitua por: -->
<policy domain="coder" rights="read|write" pattern="EPS" />
```

> **PS:** Você precisará de privilégios de administrador

## Construindo o livro

Após construído, seu livro estará pronto como `book.pdf`.

### Unix Shell
```
$ ./makebook
$ ./makebook clean
```

### PowerShell
```
PS> .\makebook
PS> .\makebook clean
```

### Windows CMD
```
C:\> makebook
C:\> makebook clean
```
