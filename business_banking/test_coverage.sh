#!/usr/bin/env bash

# Flutter and lcov/genhtml, must be installed on you path.
flutter test --coverage --coverage-path ./coverage/lcov.info test
genhtml coverage/lcov.info -o coverage/html

reportPath="$(pwd)/coverage/html/index.html"

echo "See the coverage here:"
echo $reportPath
# Uncomment to open automatically:
# open -a  "Google Chrome" file:///$reportPath
# open -a  "Firefox" file:///$reportPath
# open -a  "Safari" file:///$reportPath