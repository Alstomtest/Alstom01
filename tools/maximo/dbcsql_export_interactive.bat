@echo off

SETLOCAL

echo Maximo DBC SQL Export Tool UI

echo Enter an option (ORACLE or MSSQL):
echo  (1) MSSQL
echo  (2) ORACLE

set /p dbtype=Database Type: 

set /p output=Folder Output (Leave Blank for Auto): 
IF [%output%]==[] set output=""

set /p deletes=Create Delete Statements (y/n): 

echo Enter an Object:
set /p object=Object: 

echo Enter a Where:
set /p where=Where: 


cd ..\maximo
call commonEnv.bat

set MAXIMO_CLASSPATH=%MAXIMO_CLASSPATH%;%MAXIMO_HOME%\tools\maximo\classes

echo ..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSDBCSQLExport 1 %identifier% %dbtype% %output% %deletes% %object% %where%
@..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSDBCSQLExport 1 %identifier% %dbtype% %output% %deletes% %object% %where%
