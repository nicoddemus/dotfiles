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
alias ss=py27 x:\ss\ss.py
alias activate=x:\dotfiles\activate.bat
alias deactivate=x:\dotfiles\deactivate.bat

for %v in (26, 27, 32, 33, 34) (
    alias py%v=D:\Programming\Python%v\python.exe
    alias pip%v=py%v -m pip
    alias py.test%v=py%v D:\Programming\Python%v\Scripts\py.test-script.py 
    alias venv%v=d:\Programming\Python%v\Scripts\virtualenv.exe
)

alias pypy=d:\Programming\pypy\pypy.exe
alias tox=d:\Programming\Python27\Scripts\tox.exe
alias ec=D:\Programming\Shared\eclipse\eclipse.exe
alias np=notepad++
alias cit=x:\cit\cit.bat
alias gitext=D:\Programming\GitExtensions\GitExtensions.exe
alias x=start explorer
alias pyc=D:\Programming\PyCharm\bin\pycharm.exe

set PATH="C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC";%PATH%
set PATH="C:\Program Files\Java\jre7\bin";%PATH%
set PATH="D:\Programming\CMake28\bin";%PATH%
set PATH="D:\Programming\Git\bin";%PATH%
set PATH="D:\Programming\Vagrant\bin";%PATH%
set PATH="D:\Programming\VirtualBox";%PATH%
set PATH="D:\Programming\Ruby1.9\bin";%PATH%
set PATH="d:\Programming\mkvtoolnix";%PATH%
if exist call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
if exist call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat" 
if exist call D:\Programming\DevKit\devkitvars.bat

REM set PYTHONHOME=D:\Programming\Python27
REM set PYTHONPATH=D:\Programming\Python27\dlls;D:\Programming\Python27\lib;D:\Programming\Python27\lib\site-packages
REM set PATH=D:\Programming\Python27;D:\Programming\Python27\Scripts;%PATH%
set PATH=x:\.rbenv\bin;%PATH%
set TERM=msys

SET "VS90COMNTOOLS=%VS100COMNTOOLS%"


REM prompt
set PROMPT=%%@EXECSTR[python %~dp0\get_prompt.py]

REM TODO dashboard
set TODO_DASHBOARD_GIT_URL=https://eden.esss.com.br/stash
set TODO_DASHBOARD_PROJECTS=ESSS
