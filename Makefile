# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (C) 2019, 2023 Linaro Limited
# Author: Dan Rue <dan.rue@linaro.org>
#
# Copyright (C) 2019, 2020, 2023 Collabora Limited
# Author: Guillaume Tucker <guillaume.tucker@collabora.com>

test: \
	mypy \
	pylint \
	pycodestyle \
	unit-tests \
	validate-yaml

mypy:
	mypy \
		-m kernelci.api \
		-m kernelci.api.latest \
		-m kernelci.api.helper

pylint:
	pylint --reports=y \
		kernelci.api \
		kernelci.cli \
		kernelci.config \
		kernelci.runtime \
		kernelci.scheduler \
		kernelci.storage \
		tests

pycodestyle:
	pycodestyle kernelci
	pycodestyle tests/*

unit-tests:
	python3 -m pytest tests

validate-yaml:
	./kci_rootfs validate
