install:
	sudo apt-get install git python-pip
	sudo easy_install --upgrade pip
	pip install pycodestyle
	pip install autopep8
	python setup.py install --user

format:
	sudo autopep8 --in-place --recursive .

check-codestyle:
	pycodestyle server.py
	pycodestyle snips_skill_weather_owm/weather.py

test:
	python setup.py test

clean:
	rm -fr build
	rm -fr dist
	rm -fr snipsowm.egg-info

upload:
	@make clean
	python setup.py install --user
	python setup.py sdist
	python setup.py bdist_wheel --universal
	twine upload dist/*