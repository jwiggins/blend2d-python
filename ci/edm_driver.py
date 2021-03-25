#
#  Copyright (c) 2017, Enthought, Inc.
#  Copyright (c) 2019-2021 John Wiggins
#  All rights reserved.
#
#  This software is provided without warranty under the terms of the BSD
#  license included in enthought/LICENSE.txt and may be redistributed only
#  under the conditions described in the aforementioned license.  The license
#  is also available online at http://www.enthought.com/licenses/BSD.txt
#
#  Thanks for using Enthought open source!
#

import os
import subprocess
import sys

import click

DEPENDENCIES = {
    'cython',
    'numpy',
}
CONFIG_FILE = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '.edm.yaml')
)


@click.group()
def cli():
    pass


@cli.command()
@click.option('--runtime', default='3.6')
@click.option('--environment', default=None)
def install(runtime, environment):
    """ Install project and dependencies into a clean EDM environment.
    """
    parameters = get_parameters(runtime, environment)
    parameters['packages'] = ' '.join(DEPENDENCIES)
    # edm commands to setup the development environment
    commands = [
        "{edm} environments create {environment} --force --version={runtime}",
        "{edm} install -y -e {environment} {packages}",
        "edm run -e {environment} -- pip install cmake",
        "edm run -e {environment} -- pip install -e .",
    ]
    click.echo("Creating environment '{environment}'".format(**parameters))
    execute(commands, parameters)
    click.echo('Done install')


@cli.command()
@click.option('--runtime', default='3.6')
@click.option('--environment', default=None)
def test(runtime, environment):
    """ Run the test suite in a given environment with the specified toolkit.
    """
    parameters = get_parameters(runtime, environment)
    environ = {'PYTHONUNBUFFERED': '1'}
    commands = [
        "edm run -e {environment} -- python -m unittest discover blend2d"
    ]

    click.echo("Running tests in '{environment}'".format(**parameters))
    os.environ.update(environ)
    execute(commands, parameters)
    click.echo('Done test')


@cli.command()
@click.option('--runtime', default='3.6')
@click.option('--environment', default=None)
def cleanup(runtime, environment):
    """ Remove a development environment.
    """
    parameters = get_parameters(runtime, environment)
    commands = [
        "edm run -e {environment} -- python setup.py clean",
        "edm environments remove {environment} --purge -y",
    ]
    click.echo("Cleaning up environment '{environment}'".format(**parameters))
    execute(commands, parameters)
    click.echo('Done cleanup')


# ----------------------------------------------------------------------------
# Utility routines
# ----------------------------------------------------------------------------

def get_parameters(runtime, environment):
    """ Set up parameters dictionary for format() substitution """
    parameters = {
        'runtime': runtime,
        'environment': environment,
        'edm': 'edm --config {}'.format(CONFIG_FILE),
    }
    if environment is None:
        parameters['environment'] = 'blend2d-{runtime}'.format(**parameters)
    return parameters


def execute(commands, parameters):
    for command in commands:
        click.echo("[EXECUTING]" + command.format(**parameters))
        try:
            subprocess.check_call(command.format(**parameters).split())
        except subprocess.CalledProcessError:
            sys.exit(1)


if __name__ == '__main__':
    cli()
