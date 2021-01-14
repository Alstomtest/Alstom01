@echo off

SETLOCAL

echo Maximo Integration Framework Export Tool UI

echo Enter an option (ORACLE or MSSQL):
echo  (1) MSSQL
echo  (2) ORACLE

set /p dbtype=Database Type: 

set /p output=File Output: 

set /p deletes=Create Delete Statements (y/n): 

echo Enter an option:
echo  (1) Object Structure
echo  (2) End Point
echo  (3) Web Service
echo  (4) Enterprise Service
echo  (5) External System
echo  (6) Publish Channel
echo  (7) ALL
echo  (8) Invocation Channel
echo  (9) OSLC Resources
echo  (10) JSON Resources

set /p type=: 

echo Enter the value of the column below (it depends on the type chosen before):
echo  INTOBJECTNAME (Object Structure) 
echo  ENDPOINTNAME  (End Point)
echo  IFACENAME     (Enterprise Service, Publish Channel)
echo  EXTSYSNAME    (External System)
echo  WSNAME        (Web Service)
echo  RESOURCENAME  (JSON Resources)

set /p identifier=: 


cd ..\maximo
call commonEnv.bat

set MAXIMO_CLASSPATH=%MAXIMO_CLASSPATH%;%MAXIMO_HOME%\tools\maximo\classes

echo ..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSMIFExport %type% %identifier% %dbtype% %output% %deletes%
@..\java\jre\bin\java  -Xmx512m -DentityExpansionLimit=500000 -classpath %MAXIMO_CLASSPATH% com.ibm.gbs.gbsassets.en.GBSMIFExport %type% %identifier% %dbtype% %output% %deletes%

echo MIF script file generated at %output%
pause