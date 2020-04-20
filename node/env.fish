set -gx NODE_ENV development

# delete if you already modified MANPATH elsewhere in your config
set -e MANPATH 
set -gx MANPATH $NPM_PACKAGES/share/man

