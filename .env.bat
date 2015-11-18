@echo off

REM ANSI color codes
set bright_green=$e[1;32;m
set red=$e[0;31;m
set green=$e[0;32;m
set normal=$e[0;m
set brown=$e[0;33;m
set yellow=$e[1;33;m
set bright_cyan=$e[1;36;m
set bright_red=$e[1;31;m
set white_on_red=$e[37;41;m
set grey=$e[1;30;m
 
set HOME=x:\
set .rb=ruby
alias mu=python D:\Programming\cygwin\home\Nico\projects\mu-repo\mu.py
alias vim=D:\Programming\Shared\vim-7.2\vim72\gvim.exe
alias d=dir
alias ss=x:\ss\.env27\Scripts\python.exe x:\ss\ss.py
alias activate=x:\dotfiles\activate.bat
alias deactivate=x:\dotfiles\deactivate.bat
alias ac=activate
alias de=deactivate
alias makedoc=sphinx-build -b html . _build

for %v in (26, 27, 32, 33, 34, 35) (
    alias py%v=D:\Programming\Python%v\python.exe
    alias pip%v=py%v -m pip
    alias venv%v=d:\Programming\Python%v\Scripts\virtualenv.exe
)

alias pypy=d:\Programming\pypy\pypy.exe
alias st="C:\Program Files\Sublime Text 2\sublime_text.exe"
set EDITOR="C:\Program Files\Sublime Text 2\sublime_text.exe" 
alias cit=x:\cit\cit.bat
alias gitext=D:\Programming\GitExtensions\GitExtensions.exe
alias x=start explorer
alias pyc=C:\PyCharm\bin\pycharm.exe

alias vcvars34="C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
alias vcvars27="C:\Users\Bruno\AppData\Local\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat"
set PATH=D:\Programming\Hub;%PATH%
REM set PATH="C:\Program Files\Java\jre7\bin";%PATH%
REM set PATH="D:\Programming\CMake28\bin";%PATH%
REM set PATH="D:\Programming\Vagrant\bin";%PATH%
REM set PATH="D:\Programming\VirtualBox";%PATH%
REM set PATH="D:\Programming\Ruby1.9\bin";%PATH%
set PATH="d:\Programming\mkvtoolnix";%PATH%
if exist call D:\Programming\DevKit\devkitvars.bat

REM set PYTHONHOME=D:\Programming\Python27
REM set PYTHONPATH=D:\Programming\Python27\dlls;D:\Programming\Python27\lib;D:\Programming\Python27\lib\site-packages
REM set PATH=D:\Programming\Python27;D:\Programming\Python27\Scripts;%PATH%
REM set PATH=x:\.rbenv\bin;%PATH%
REM set TERM=msys

SET "VS90COMNTOOLS=%VS100COMNTOOLS%"


REM prompt
set PROMPT=%%@EXECSTR[python %~dp0\get_prompt.py]

REM TODO dashboard
set TODO_DASHBOARD_GIT_URL=https://eden.esss.com.br/stash
set TODO_DASHBOARD_PROJECTS=ESSS

set INCLUDE=x:\gtest-1.7.0\include;%INCLUDE%
set INCLUDE=x:\boost_1_55_0;%INCLUDE%

set LIBPATH=x:\gtest-1.7.0\Release;%LIBPATH%

set QT_QPA_PLATFORM_PLUGIN_PATH=d:\Programming\Python34\Lib\site-packages\PyQt5\plugins\platforms\
alias qpa=set QT_QPA_PLATFORM_PLUGIN_PATH=%%1\Lib\site-packages\PyQt5\plugins\platforms
