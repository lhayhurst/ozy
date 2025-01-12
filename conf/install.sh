#!/usr/bin/env bash
# Should be suitable to be `curl | bash`'d

set -euo pipefail

echo Installing ozy pointing at the ozy sample team configuration on GitHub...

OZY_CONFIG_URL=https://raw.githubusercontent.com/aquanauts/ozy/master/conf/sample-team-conf.yaml
OZY_VERSION=$(curl -sL ${OZY_CONFIG_URL} | grep 'ozy_version:' | awk '{print $2}')

TMP_INSTALL_DIR=/tmp/install-ozy-$$
mkdir ${TMP_INSTALL_DIR}
TMP_INSTALL_FILE=${TMP_INSTALL_DIR}/ozy
# ozy needs to be called "ozy" to work
curl -sL -o ${TMP_INSTALL_FILE} https://github.com/aquanauts/ozy/releases/download/v${OZY_VERSION}/ozy
chmod +x ${TMP_INSTALL_FILE}
${TMP_INSTALL_FILE} init ${OZY_CONFIG_URL}
rm -rf ${TMP_INSTALL_DIR}

echo
echo '********************************'
echo 'Installed ok. Make sure you follow any instructions above to ensure ozy is on your path.'
echo '********************************'
