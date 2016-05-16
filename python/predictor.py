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

 
@app.route("/predict/<int:op1>/<int:op2>/<int:op>/")
def predict(op1,op2,op):
	data={'Operador1':[op1],
		  'Operador2':[op2],
		  'TipoOperacion':[op]
		 }
	a=pandas.DataFrame(data, columns=['Operador1', 'Operador2', 'TipoOperacion'])
	if op == '+':
		b = add_model.predict(a)
	elif op == '-':
		b = sub_model.predict(a)
	elif op == '*':
		b = mul_model.predict(a)
	elif op == '/':
		b = div_model.predict(a)
	else:
		b = "error"
	return str(b[0])
 
@app.route("/user/<username>")
def xxxxxx(username):
	return "Hello " + username + "!!!"
	
if __name__ == "__main__":

    app.run()
