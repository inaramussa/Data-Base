#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
import psycopg2
import psycopg2.extras


## SGBD configs
DB_HOST = "db.tecnico.ulisboa.pt"
DB_USER = "ist123456"  # Your IST ID
DB_DATABASE = DB_USER
DB_PASSWORD = "uuaa2854"  # Your psql_reset password
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (
    DB_HOST,
    DB_DATABASE,
    DB_USER,
    DB_PASSWORD,
)

app = Flask(__name__)

@app.route("/home")
@app.route("/")
def home():
    """Serve homepage template."""
    return render_template('home.html')

##mostra  a tabela de categorias
@app.route("/categoria")
def lista_categorias():
    dbConn=None
    cursor=None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
        query = "SELECT * FROM categoria;"
        cursor.execute(query)
        return render_template("categoria.html", cursor=cursor, params=request.args)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()

@app.route("/inserir_categoria")
def lista_categorias():
    dbConn=None
    cursor=None
    try:
        return render_template("inserir_categoria.html", cursor=cursor, params=request.args)
    except Exception as e:
        return str(e)

@app.route("/remover_categoria")
def lista_categorias():
    dbConn=None
    cursor=None
    try:
        return render_template("remover_categoria.html", cursor=cursor, params=request.args)
    except Exception as e:
        return str(e)


CGIHandler().run(app)