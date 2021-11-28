RED = $(shell tput setaf 1)
GREEN = $(shell tput setaf 2)
YELLOW = $(shell tput setaf 3)
BLUE = $(shell tput setaf 4)
MAGENTA = $(shell tput setaf 5)
CYAN = $(shell tput setaf 6)
RESETCOLOR = $(shell tput sgr0)

.PHONY: dotter-dry-run
dotter-dry-run:
	dotter --dry-run

.PHONY: dotter
dotter:
	dotter
