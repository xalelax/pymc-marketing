.PHONY: init lint check_lint test

init:
	python -m pip install -e .

lint:
	pip install .[lint]
	isort .
	black .

check_lint:
	pip install .[lint]
	flake8 .
	isort --check-only .
	black --diff --check --fast .

test:
	pip install .[test]
	pytest

html:
	sphinx-build docs/source docs/build -b html

cleandocs:
	rm -r "docs/build" "docs/jupyter_execute" "docs/source/api/generated"
