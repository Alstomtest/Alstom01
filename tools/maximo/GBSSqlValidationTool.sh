#!/bin/sh

pathToScript=`dirname %0`
. $pathToScript/commonenv.sh

../java/jre/bin/java -Dswing.handleTopLevelPaint=false -classpath .:./classes:$MAXIMO_CLASSPATH com.ibm.gbs.gbsassets.en.GBSSqlStatementValidation

exit $?
