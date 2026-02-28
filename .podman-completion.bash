#!/usr/bin/env bash
# Podman Command Autocompletion Script
#
# This script enables tab autocomplete for the podman command in Bash.
#
# FEATURES:
# - Tab completion for all podman subcommands (run, build, pull, push, etc.)
# - Tab completion for container, image, pod, and volume names
# - Tab completion for podman options and flags
#
# INSTALLATION:
# 1. Copy this file to your home directory or another convenient location
# 2. Add the following line to your ~/.bashrc or ~/.bash_profile:
#    source ~/.podman-completion.bash
# 3. Restart your shell or run: source ~/.bash_profile
#
# USAGE:
# After installation, simply type 'podman ' and press TAB to see available subcommands.
# When managing containers, type 'podman run ' and press TAB to autocomplete options.
#
# REQUIREMENTS:
# - Podman must be installed (https://podman.io)
#
# NOTES:
# - Prefers the system-installed bash completion file for podman if available
# - Falls back to generating completions via 'podman completion bash' if podman is in PATH

# Primary: source the system-installed podman bash completion file
if [[ -r "/usr/share/bash-completion/completions/podman" ]]; then
    . "/usr/share/bash-completion/completions/podman"
elif type podman &>/dev/null; then
    # Fallback: generate completions dynamically from the installed podman binary
    source <(podman completion bash)
fi

# End of Podman Command Autocompletion Script
