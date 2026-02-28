#!/usr/bin/env bash
# Podman Command Autocompletion Script
#
# This script enables tab autocomplete for the Podman container engine command
# in Bash by sourcing the completion support that ships with Podman.
#
# FEATURES:
# - Tab completion for all podman subcommands (run, build, pull, push, etc.)
# - Tab completion for container, image, volume, and network names
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
# When running containers, type 'podman run ' and press TAB to autocomplete image names.
#
# REQUIREMENTS:
# - Podman must be installed (https://podman.io)
#
# NOTES:
# - Podman ships its own completion scripts via 'podman completion bash'
# - Falls back to system-installed completion files if the command is unavailable
# - Requires the bash-completion package (_get_comp_words_by_ref) to be loaded first

# Ensure bash-completion helpers (e.g. _get_comp_words_by_ref) are available.
# They are normally provided by the bash-completion package.  Load it from the
# first readable location if it has not already been sourced.
if ! declare -f _get_comp_words_by_ref &>/dev/null; then
    for _podman_bash_completion in \
        "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" \
        "/usr/share/bash-completion/bash_completion" \
        "/etc/bash_completion"; do
        if [[ -r "$_podman_bash_completion" ]]; then
            . "$_podman_bash_completion"
            break
        fi
    done
    unset _podman_bash_completion
fi

# Check if podman is available and bash-completion helpers are loaded
if command -v podman &>/dev/null && declare -f _get_comp_words_by_ref &>/dev/null; then
    # Primary: use podman's built-in completion generator
    if podman completion bash &>/dev/null; then
        eval "$(podman completion bash)"
    else
        # Fallback: source system-installed podman completion file
        for _podman_completion_file in \
            "/usr/share/bash-completion/completions/podman" \
            "/etc/bash_completion.d/podman"; do
            if [[ -r "$_podman_completion_file" ]]; then
                . "$_podman_completion_file"
                break
            fi
        done
        unset _podman_completion_file
    fi
fi

# End of Podman Command Autocompletion Script
