
from flask import Flask
app = Flask(__name__)

def create_response(option):
    body_content = option.url
    header_content = ""

    res = response(body_content, header_content)

    logger.log("response generated: ", res)

    return res 

@app.route("/login")
def generate_login(parameters):
    session = new_session(parameters.identifier, credential)
    return session 


@app.route("/")
def hello():
    return "Hello World!"

@app.route("/entry/{option}")
def entry_output(option):
    logger.log(context.session_id)
    response = create_response(option)
    return response 

if __name__ == "__main__":
    app.run(debug=True)