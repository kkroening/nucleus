from setuptools import setup

setup(
    name='nucleus',
    version='0.0.1',
    description='Nucleus',
    author='Karl Kroening',
    author_email='karlk@kralnet.us',
    url='https://github.com/kkroening/nucleus',
    packages=['nucleus'],
    tests_require=['pytest'],
    install_requires=[
        #'matplotlib',
        #'tensorflow',
        'black<=21.9b0',  # Upgrading past this breaks py2 formatting.
        'flake8',
        'future',
        'gpustat',
        'IPython',
        'ipywidgets',
        'isort',
        'jupyterlab',
        'nbstripout',
        'pandas',
        'pydash',
        'pylint',
        'pyyaml',
        'requests',
        'xlrd',
        'yq',
    ],
    entry_points={
        'console_scripts': [
            'camel=nucleus.camel:main',
            'snake=nucleus.snake:main',
            'csview=nucleus.csview:main',
            'xlsx2csv=nucleus.xlsx2csv:main',
        ],
    },
)
