from fastapi import FastAPI
import numpy as np, scipy
from scipy import spatial
from collections import Counter
import uvicorn


app = FastAPI()

@app.get('/')
def base():
    return {'message': 'text_matching_model'}


@app.post('/estimate')
def estimate(a, b):
    a_vector=Counter(a.split())
    b_vector=Counter(b.split())
    vsp=set(a_vector)|set(b_vector)
    a=np.array([a_vector[x] for x in vsp])
    b=np.array([b_vector[x] for x in vsp])
    return round(float(1-spatial.distance.cosine(a,b)),3)