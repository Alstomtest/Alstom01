@echo off

SETLOCAL

echo Maximo SQL Statement Validation Tool

cd ..\maximo
call commonEnv.bat

set MAXIMO_CLASSPATH=%MAXIMO_CLASSPATH%;%MAXIMO_HOME%\tools\maximo\classes

echo ..\java\jre\bin\java -Xmx1024m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSSqlStatementValidation
@..\java\jre\bin\java -Xmx1024m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSSqlStatementValidation