#!/bin/bash

# redirect stdout and stderr to files
exec >/log/state-dump.json
exec 2>/log/ghostferry.log

# now run the requested CMD without forking a subprocess
exec "$@"