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
        'black',
        'IPython',
        'pandas',
        'pydash',
        'pyflakes',
        'pylint',
    ],
    entry_points={
        'console_scripts': [
            'camel=nucleus.camel:main',
            'snake=nucleus.snake:main',
            'csview=nucleus.csview:main',
        ],
    },
)
