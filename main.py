import io
import json
from torchvision import models
import torchvision.transforms as transforms
from PIL import Image
import fastapi
from fastapi import FastAPI, UploadFile, HTTPException
import uvicorn


app = FastAPI()
model = models.densenet121(pretrained=True)
model.eval()
imagenet_class_index = json.load(open("imagenet_class_index.json", encoding="utf-8"))

