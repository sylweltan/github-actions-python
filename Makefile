MODULE := mocho_baro
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No color

run:
	@python -m $(MODULE)

test-level-01:
	@echo "\n${RED}Running TEST level 01 ${NC}\n"
	pytest

test-level-02:
	@echo "\n${RED}Running TEST level 02 ${NC}\n"
	@python -m ${MODULE} -f input_file1.log -o output_file1.log
	@python -m ${MODULE} -f input_file2.log -o output_file2.log

lint:
	@echo "\n${RED}Running LINT ${NC}\n"
	@echo "\n${YELLOW}step 01 - pylint ${NC}\n"
	@pylint --rcfile=setup.cfg *.py
	@echo "\n${YELLOW}step 02 - pydocstyle ${NC}\n"
	@pydocstyle --config=setup.cfg mocho_baro.py
	@echo "\n${YELLOW}step 03 - your advert here ${NC}\n"
	@echo "\n${YELLOW} więcej stepów przybędzie jak działać będzie ${NC}\n"

clean:
	rm -rf .pytest_cache .coverage .pytest_cache coverage.xml *output*log

.PHONY: clean test


