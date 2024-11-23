from flask import Flask,jsonify,request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS



app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///todo.db'
db = SQLAlchemy(app)

class ToDo(db.Model):
    __tablename__ = "todos"
    id = db.Column(db.Integer,primary_key=True)
    description = db.Column(db.String,nullable = False)
    done = db.Column(db.Boolean,default=False)
    
    def __repr__(self):
        return f"Todo('{self.description}','{self.done}')"

@app.route("/")
def getList():
    return jsonify(message= "It is working")

#=============CREATE A NEW TASK PATH ===========
@app.route("/create_new",methods = ['POST'])
def create_new_task():
   data = request.get_json()
   if "description" not in data:
      return jsonify({"Error":"Missing task description"}), 400
   new = ToDo(description = data["description"])
   db.session.add(new)
   db.session.commit()
   return jsonify(message = "New task created successfully")


#===============GET ALL TODOS ==========
@app.route("/retrieve_all", methods = ['GET'])
def retrieve_all():
   todos = ToDo.query.all()
   data = []
   for todo in todos:
     data.append(
         {
            "id": todo.id,
            "description": todo.description,
            "done": todo.done,
         }
        )

   return jsonify(data)

#=========== DELETE A PARTICULAR TASK ===========
@app.route("/delete_task/<int:id>",methods=['DELETE'])
def delete_task(id):
   todo = ToDo.query.get(id)
   db.session.delete(todo)
   db.session.commit()

   return jsonify({
      "message": "deleted successfully"
   })


with app.app_context():
    db.create_all() 