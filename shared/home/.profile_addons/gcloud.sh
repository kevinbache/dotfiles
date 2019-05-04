#!/usr/bin/env bash
# TODO: Move out of downloads
# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '${HOME}/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '${HOME}/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH=${HOME}/Downloads/google-cloud-sdk/bin:${PATH}
