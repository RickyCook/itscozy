""" Main main application setup """
from flask import Flask
from flask_restful import Api
from flask_sqlalchemy import SQLAlchemy

APP = Flask('itscozy')
DB = SQLAlchemy(APP)
API = Api(APP, prefix='/api/v1')
