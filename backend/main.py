from fastapi import FastAPI
from pydantic import BaseModel
from pymongo import MongoClient
from bson import ObjectId
import os 

app = FastAPI()

# MongoDB connection
client = MongoClient(os.getenv("MONGO_URI"))

db = client["todo_database"]
collection = db["tasks"]


# Task structure
class Task(BaseModel):
    title: str
    description: str


# Test
@app.get("/")
def home():
    return {"message": "Todo API is working!"}


# ADD TASK
@app.post("/tasks")
def add_task(task: Task):

    task_data = {
        "title": task.title,
        "description": task.description
    }

    result = collection.insert_one(task_data)

    return {
        "message": "Task added successfully",
        "id": str(result.inserted_id)
    }


# GET ALL TASKS
@app.get("/tasks")
def get_tasks():

    tasks = collection.find({})

    result = []

    for task in tasks:
        result.append({
            "id": str(task["_id"]),
            "title": task["title"],
            "description": task["description"]
        })

    return result


# DELETE TASK
@app.delete("/tasks/{task_id}")
def delete_task(task_id: str):

    result = collection.delete_one({
        "_id": ObjectId(task_id)
    })

    if result.deleted_count == 0:
        return {
            "message": "Task not found"
        }

    return {
        "message": "Task deleted successfully"
    }