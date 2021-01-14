@echo off

SETLOCAL

echo Maximo Integration Framework Export Tool UI

echo Enter an option (ORACLE or MSSQL):
echo  (1) MSSQL
echo  (2) ORACLE

set /p dbtype=Database Type: 

set /p output=Folder Output (Leave Blank for Auto): 
IF [%output%]==[] set output=""

set /p deletes=Create Delete Statements (y/n): 

echo Enter an option:
echo  (1) Export JSON Mappings
echo  (2) Export GIS Layer Mappings
echo  (3) Export GIS Crontask
echo  (4) Export GIS Baseline Update Script
echo  (5) Export All Domains - Temp Exporter (Wont export with All)
echo  (6) Map Service Configuration
echo  (10) All
set /p type=Export Type: 

cd ..\maximo
call commonEnv.bat

set MAXIMO_CLASSPATH=%MAXIMO_CLASSPATH%;%MAXIMO_HOME%\tools\maximo\classes

echo ..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSGISExport %type% %identifier% %dbtype% %output% %deletes%
@..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSGISExport %type% %identifier% %dbtype% %output% %deletes%

IF [%output%]==[""] goto autoLocation

echo MIF script file generated at %output%
goto scriptEnd

:autoLocation
echo MIF script file generated at automatic file location.
goto scriptEnd

:scriptEnd
pause