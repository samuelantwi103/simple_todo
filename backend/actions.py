from app import *
from flask import request,jsonify

def create_new_task():
   data = request.get_json()
   if "description" not in data:
      return jsonify({"Error":"Missing task description"}), 400
   new = ToDo(description = data["description"])
   db.session.add(new)
   db.session.commit()
   return jsonify(message = "New task created successfully")



