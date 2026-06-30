@echo off
set "PROJECT_DIR=%~dp0"
set "CATALINA_HOME=%PROJECT_DIR%apache-tomcat-9.0.73"
set "CATALINA_BASE=%PROJECT_DIR%apache-tomcat-9.0.73"
set "DB_URL=jdbc:mysql://localhost:3307/hospital_management"
set "DB_USER=root"
set "DB_PASS=Hness@cb350"
call "%CATALINA_HOME%\bin\catalina.bat" run
