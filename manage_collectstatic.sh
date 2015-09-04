#!/bin/sh -x
STATIC_ROOT=itscozy/static
cp bower_components/bootstrap/dist/css/bootstrap.min.css $STATIC_ROOT/lib/css

cp bower_components/bootstrap/js/dropdown.js $STATIC_ROOT/lib/js
cp bower_components/bootstrap/js/modal.js $STATIC_ROOT/lib/js
cp bower_components/bootstrap/js/tab.js $STATIC_ROOT/lib/js
cp bower_components/bootstrap/js/transition.js $STATIC_ROOT/lib/js
cp bower_components/jquery/dist/jquery.min.js $STATIC_ROOT/lib/js
