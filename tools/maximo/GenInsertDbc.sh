cd /opt/IBM/SMP/maximo/tools/maximo
export CLASSPATH=/opt/IBM/SMP/maximo/tools/maximo/classes:/opt/IBM/SMP/maximo/applications/maximo/lib/jdom.jar:/opt/IBM/SMP/maximo/applications/maximo/lib/log4j-1.2.16.jar:/opt/IBM/SMP/maximo/applications/maximo/businessobjects/classes:/opt/IBM/SMP/maximo/applications/maximo/lib/j2ee.jar:/opt/IBM/SMP/maximo/tools/maximo:/opt/IBM/SMP/maximo/applications/maximo/lib/icu4j.jar:/opt/IBM/SMP/maximo/applications/maximo/lib/db2jcc.jar
echo "To Generate Run as below"
echo "java  psdi.tools.GenInsertDbc -t<table name> -w<where clause> -f<script file name> "
echo "For Example: "
echo "java  psdi.tools.GenInsertDbc -tsite -w1=1 -fleo.dbc"
$SHELL
cd /opt/IBM/SMP/maximo/tools/maximo

