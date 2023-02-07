from bottle import get, post, run, request, response
import sqlite3


db = sqlite3.connect("movies.sqlite")

@get('/ping')
def get_ping():
    response.status = 200
    return '<b>PONG</b>!'

PORT=7007

@post('/reset')
def post_reset():
    theaters = request.json
    c = db.cursor()
    c.execute(
        """
        INSERT
        INTO       students(s_name, gpa, size_hs)
        VALUES     (?, ?, ?)
        RETURNING  s_id
        """,
        [theaters['name'], theaters['capacity']]
    )
    found = c.fetchone()
    if not found:
        response.status = 400
        return "Illegal..."
    else:
        db.commit()
        response.status = 201
        s_id, = found
        return f"http://localhost:{PORT}/{s_id}"

@get('/movies')
def get_movies():
    c = db.cursor()
    c.execute(
        """
        SELECT   imdb_key, movie_name, production_year
        FROM     movies
        """
    )
    found = [{"imdbKey": imdb_key,"title": movie_name, "year": production_year}
             for imdb_key,movie_name, production_year in c]
    response.status = 200
    return {"data": found}

run(host='localhost', port=7007)