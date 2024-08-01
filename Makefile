# SPDX-FileCopyrightText: 2024 Jomco B.V.
# SPDX-FileCopyrightText: 2024 Topsector Logistiek
# SPDX-FileContributor: Joost Diepenmaat <joost@jomco.nl>
# SPDX-FileContributor: Remco van 't Veer <remco@jomco.nl>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

.PHONY: check working_tree_clean_check test

working_tree_clean_check:
# ensure no uncommitted stuff
# git-status --porcelain should print 0 lines.  wc -l counts lines
# tee /dev/fd/2 prints any uncommitted changes to stderr for logging in CI
	exit $$(git status --porcelain |tee /dev/fd/2| wc -l)

check: working_tree_clean_check
	$(MAKE) -C ishare-jwt check

test:
	$(MAKE) -C ishare-jwt test
