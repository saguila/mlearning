import pandas
from flask import Flask
app = Flask(__name__)


from sklearn.externals import joblib

  # Cargo el modelo que he entrenado previamente.
add_model = joblib.load('add.pkl')
sub_model = joblib.load('sub.pkl')
mul_model = joblib.load('mul.pkl')
div_model = joblib.load('div.pkl')

@app.route("/")
def hello():
    return "Hello World!"

 
@app.route("/predict/<int:op1>/<int:op2>/<string:op>/")
def predict(op1,op2,op):
	data={'Operador1':[op1], 'Operador2':[op2]}
	a=pandas.DataFrame(data, columns=['Operador1', 'Operador2'])
	if op == 'add':
		b = add_model.predict(a)
	elif op == 'sub':
		b = sub_model.predict(a)
	elif op == 'mul':
		b = mul_model.predict(a)
	elif op == 'div':
		b = div_model.predict(a)
	else:
		b = "E"
	return str(b[0])
 
@app.route("/user/<username>")
def xxxxxx(username):
	return "Hello " + username + "!!!"
	
if __name__ == "__main__":

    app.run()
