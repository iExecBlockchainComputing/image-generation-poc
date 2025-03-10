import sys
import os
import time
import torch
from diffusers import StableDiffusionPipeline
from PIL import Image
import json

input_directory = os.environ["IEXEC_IN"]
output_directory = os.environ["IEXEC_OUT"]
prompt = os.environ["IEXEC_REQUESTER_SECRET_1"]


def saveImage(image, filename="generated_image.png"):
    output_path = os.path.join(output_directory, filename)
    image.save(output_path)

    with open(os.path.join(output_directory, 'computed.json'), 'w') as f:
        json.dump({"deterministic-output-path": output_path}, f)

    return

def loadModel(path):
    pipe = StableDiffusionPipeline.from_pretrained(path)
    return pipe.to("cpu")


def generateImage(pipe, prompt):
    return pipe(prompt).images[0]



print("reached")
model_path = "CompVis/stable-diffusion-v1-4" # Image generator

if prompt is None: print("No prompt provided")
else: 
    print("Provided Prompt: ", prompt)

    model = loadModel(model_path)
    image = generateImage(model, prompt)

    saveImage(image)





