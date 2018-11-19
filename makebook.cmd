@echo off

:: Copyright (c) E5R Development Team. All rights reserved.
:: Licensed under the Apache License, Version 2.0. More license information in LICENSE.

goto:main

:_show_log
    echo log^: %~1
    goto:eof

:_show_error
    echo err^: %~1
    goto:eof

:clean
    del /F book.aux ^
           book.log ^
           book.lof ^
           book.lot ^
           book.toc ^
           book.dvi ^
           book.pdf
    goto:eof

:convert_images
    call:_show_log "Converting images..."
    if exist book/cover.png (
        magick book/cover.png book/cover.eps
    )
    if exist book/img/*.png (
        magick mogrify -format eps book/img/*.png
    )
    goto:eof

:make
    call:convert_images
    :: Generating TOC
    latex book.tex
    :: Recompilling with TOC
    latex book.tex
    :: Generating PDF
    dvipdfm book.dvi
    goto:eof

:main
    where latex > nul 2>&1
    if %ERRORLEVEL% neq 0 (
        call:_show_error "latex is required"
        exit /b 1
    )

    where dvipdfm > nul 2>&1
    if %ERRORLEVEL% neq 0 (
        call:_show_error "dvipdfm is required"
        exit /b 1
    )

    where magick > nul 2>&1
    if %ERRORLEVEL% neq 0 (
        call:_show_error "magick is required"
        exit /b 1
    )

    if "%~1" equ "clean" (
        call:_show_log "Cleaning..."
        call:clean
        exit /b 0
    )

    call:_show_log "Making book..."
    call:make

exit /b %ERRORLEVEL%
