default: prepare_source export_vscode_extensions

prepare_source: rearrange_brewfile 

export_vscode_extensions:
	rm -f vscode_extensions.yaml
	echo vscode_ext: > vscode_extensions.yaml
	code --list-extensions | xargs -I{} echo - "\"{}\""\
	>> vscode_extensions.yaml

export_brewfile:
	rm -f Brewfile
	brew bundle dump

rearrange_brewfile: export_brewfile
	# put mas files at the top (mac app store) so that latest versions are not
	# accidentally overwritten by brew later
	bash rearrange.sh Brewfile rearranged_Brewfile

