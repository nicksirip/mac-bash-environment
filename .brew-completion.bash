#!/usr/bin/env bash
# Brew Command Autocompletion Script
#
# This script enables tab autocomplete for the Homebrew (brew) command in Bash
# by sourcing the completion support that ships with Homebrew.
#
# FEATURES:
# - Tab completion for all brew subcommands (install, uninstall, upgrade, etc.)
# - Tab completion for formula and cask names
# - Tab completion for brew options and flags
#
# INSTALLATION:
# 1. Copy this file to your home directory or another convenient location
# 2. Add the following line to your ~/.bashrc or ~/.bash_profile:
#    source ~/.brew-completion.bash
# 3. Restart your shell or run: source ~/.bash_profile
#
# USAGE:
# After installation, simply type 'brew ' and press TAB to see available subcommands.
# When installing packages, type 'brew install ' and press TAB to autocomplete formula names.
#
# REQUIREMENTS:
# - Homebrew must be installed (https://brew.sh)
# - The HOMEBREW_PREFIX environment variable must be set, or brew must be in PATH
#
# NOTES:
# - Homebrew ships its own completion scripts; this file sources them automatically
# - Falls back to bash_completion.d if the profile.d script is not present

# Determine the Homebrew prefix
# Prefer the already-exported HOMEBREW_PREFIX, then fall back to `brew --prefix`
_brew_prefix="${HOMEBREW_PREFIX:-}"
if [[ -z "$_brew_prefix" ]] && type brew &>/dev/null; then
    _brew_prefix="$(brew --prefix)"
fi

if [[ -n "$_brew_prefix" ]]; then
    # Primary: source the umbrella bash_completion profile script (Homebrew 3+)
    if [[ -r "${_brew_prefix}/etc/profile.d/bash_completion.sh" ]]; then
        . "${_brew_prefix}/etc/profile.d/bash_completion.sh"
    else
        # Fallback: source individual completion files from bash_completion.d
        for _brew_completion_file in "${_brew_prefix}/etc/bash_completion.d/"*; do
            [[ -r "$_brew_completion_file" ]] && . "$_brew_completion_file"
        done
        unset _brew_completion_file
    fi
fi

unset _brew_prefix

# End of Brew Command Autocompletion Script
