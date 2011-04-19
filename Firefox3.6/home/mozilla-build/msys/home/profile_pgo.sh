#!/bin/sh

echo "Profiling..."

export NO_EM_RESTART=1

#mkdir $OBJDIR/_profileprofile

$OBJDIR/dist/bin/firefox -url http://webkit.org/perf/sunspider-0.9/sunspider-driver.html -no-remote -profile $OBJDIR/../profileprofile


