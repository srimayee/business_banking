flutter test --coverage --coverage-path ./coverage/lcov.info test
genhtml coverage/lcov.info -o coverage/html
echo "See the coverage here:"
echo "$(pwd)/coverage/html/index.html"