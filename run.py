from itscozy.server import APP
if __name__ == '__main__':
    from werkzeug.serving import run_simple
    run_simple('localhost', 5000, APP)
