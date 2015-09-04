#!/bin/bash
function collectstatic {
    mkdir -p itscozy/static/lib/css
    mkdir -p itscozy/static/lib/fonts
    mkdir -p itscozy/static/lib/js
    ./manage_collectstatic.sh; exit $?
}
function htmldeps {
    npm install
    node_modules/bower/bin/bower --allow-root install
}
function env_create {
    python3 -m virtualenv -p $(which python3) python_env
}
function env_install_reqs {
    [[ -e python_env ]] || env_create
    python_env/bin/pip install -r "$1"
}
function pythondeps {
    env_install_reqs requirements.txt
    env_install_reqs test-requirements.txt
}
function styletest {
    python_env/bin/pep8 itscozy
    python_env/bin/pylint --rcfile pylint.conf itscozy
}
function tests {
    styletest
}
function ci {
    tests
}
function migrate {
    python_env/bin/alembic upgrade head
}
function run {
    migrate
    python_env/bin/python run.py
}
function shell {
    /bin/bash
}

export PYTHONPATH=$PYTHONPATH:$(cd $(dirname $0); pwd)
case $1 in
    collectstatic) collectstatic ;;
    htmldeps) htmldeps ;;
    pythondeps) pythondeps ;;
    styletest) styletest ;;
    unittest) unittest ;;
    tests) tests ;;
    ci) ci ;;
    migrate) migrate ;;
    run) run ;;
    shell) shell ;;
    *)
        echo "Unknown command '$1'" >&2
        exit 1
esac
