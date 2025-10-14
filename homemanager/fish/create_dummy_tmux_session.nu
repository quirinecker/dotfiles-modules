#!/usr/bin/env nu

def main [] {
	let sessions = tmux ls -F '#{session_name}' | str trim
	let sessions = $"name \n ($sessions) "
	let mainSessionExists = $sessions | from ssv | where name == "main" | length | into bool
	let isInSession = $env.TMUX? != null

	if not $isInSession and not $mainSessionExists {
		# Start tmux server + dummy session to trigger continuum restore
		tmux start-server
		tmux new-session -d -s main
	}
}
