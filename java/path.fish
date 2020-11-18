# Environment Variables

set -gx GROOVY_HOME /usr/local/opt/groovy/libexec

# https://stackoverflow.com/questions/52524112/how-do-i-install-java-on-mac-osx-allowing-version-switching/52524114#52524114
set -gx JAVA_11_HOME (/usr/libexec/java_home -v 1.8)
set -gx JAVA_14_HOME (/usr/libexec/java_home -v14)

set -gx JAVA_HOME $JAVA_11_HOME
