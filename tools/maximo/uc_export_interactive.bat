@echo off

SETLOCAL

echo Maximo Use Case Export Tool UI

echo Enter an option (ORACLE or MSSQL):
echo  (1) MSSQL
echo  (2) ORACLE

set /p dbtype=Database Type: 

set /p output=File Output: 

set /p deletes=Create Delete Statements (y/n): 

echo Enter the Object name:
set /p obj=: 

echo Enter the Use Case name:
set /p identifier=: 

cd ..\maximo
call commonEnv.bat

set MAXIMO_CLASSPATH=%MAXIMO_CLASSPATH%;%MAXIMO_HOME%\tools\maximo\classes

echo ..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSUseCaseExport %obj% %identifier% %dbtype% %output% %deletes%
@..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSUseCaseExport %obj% "%identifier%" %dbtype% "%output%" %deletes%

echo Use Case script file generated at %output%
pause