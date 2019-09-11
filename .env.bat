@echo off

set COLUMNS=120
set .rb=ruby

alias d=dir

alias activate=d:\projects\dotfiles\activate.bat
alias deactivate=d:\projects\dotfiles\deactivate.bat
alias ac=activate
alias de=deactivate

alias pipu=python -m pip install -U $*

alias venv27=py -2.7 -m virtualenv .env27
alias venv35=py -3.5 -m venv .env35
alias venv36=py -3.6 -m venv .env36
alias venv37=py -3.7 -m venv .env37

alias fork=py -3.6 %~dp0fork.py

alias st="C:\Program Files\Sublime Text 3\sublime_text.exe"
alias pyc=C:\PyCharm\bin\pycharm64.exe

alias vcvars34="C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
alias vcvars35="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
alias vcvars27="C:\Users\Bruno\AppData\Local\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat"
