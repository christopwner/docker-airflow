# netsuite-cli-sq
Docker image for NetSuite's software development framework (sdf) command line interface (cli) with SonarQube (sq).

## use
Given you have properly setup a .sdf file in your project, pipe in your password and provide the working directory as shown in the following example script for Bitbucket pipelines:

> (echo $NS_PASS) | sdfcli deploy -p ${BITBUCKET_CLONE_DIR}

Some sdfcli options such as 'deploy' require a confirmation, you can deploy by putting a delay in your pipe with confirmation as shown here:

> (echo $NS_PASS && (sleep 10 && echo "YES")) | sdfcli deploy -p ${BITBUCKET_CLONE_DIR}

*Note: $NS_PASS is a secured environment variable set on Bitbucket.org (see: https://confluence.atlassian.com/bitbucket/environment-variables-794502608.html)*
