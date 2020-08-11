DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUSIONS := .DS_Store .git .gitignore .undodir .travis.yml
CANDIDATES := $(wildcard .??*) Brewfile Gemfile
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

list: ## List dotfiles in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo 'Deploying dotfiles to home directory'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean: ## Unlink dotfiles in your home directory and remove dotfiles directory
	@echo 'Remove dotfiles in your home directory'
	@-$(foreach val, $(DOTFILES), unlink $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

init: ## Install packages and tools
	@bash $(DOTPATH)/etc/init.sh

test: ## Test install dotfiles


help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

