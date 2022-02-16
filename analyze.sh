SONAR_SCANNER_VERSION=4.6.1.2450 # Find the latest version in the "Linux" link on this page:
                                 # https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
SONAR_SERVER_URL="http://localhost:9000" # To fill in
BW_OUTPUT=bw-output # same directory than the one set in `sonar-project.properties`

curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"
unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
export PATH=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin:$PATH

curl --create-dirs -sSLo $HOME/.sonar/build-wrapper.zip "${SONAR_SERVER_URL}/static/cpp/build-wrapper-linux-x86.zip"
unzip -o $HOME/.sonar/build-wrapper.zip -d $HOME/.sonar/
export PATH=$HOME/.sonar/build-wrapper-linux-x86:$PATH

cmake -S . -B build
build-wrapper-linux-x86-64 --out-dir $BW_OUTPUT cmake --build build/ --config Release
sonar-scanner
