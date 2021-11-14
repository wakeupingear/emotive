import cv2
import numpy as np
from mss import mss
from PIL import Image
from deepface import DeepFace
import sys
import os
import logging
import requests

def main():
    url="http://localhost:5000/emotion"
    isPosition=sys.argv[1]
    if len(sys.argv) >2:
        url=sys.argv[2]
    emotions={
        'neutral':0,
        'angry':1,
        'disgust':2,
        'fear':3,
        'happy':4,
        'sad':5,
        'surprise':6
    }
    weights={
        'neutral':1,
        'angry':1,
        'disgust':1,
        'fear':1,
        'happy':1,
        'sad':1,
        'surprise':1
    }
    threshold = 20;

    """
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        cap=cv2.VideoCapture(1)
    if not cap.isOpened():
        raise IOError("Cannot open webcam")
    """

    maxStr=""
    maxVal=0
    bounding_box = {'left': 12, 'top': 80, 'width': 1300, 'height': 1300,"mon":0}
    with  mss() as sct:
        while True:
            sct_img = sct.grab(bounding_box)
            frame=np.array(sct_img)

            if (isPosition != "true"):
                #sys.stdout = open(os.devnull, "w")
                try:
                    result=DeepFace.analyze(img_path=frame,actions=['emotion'])
                except:
                    continue
                #sys.stdout = old_stdout # reset old stdout
                maxStr=""
                maxVal=0
                
                for key,val in result["emotion"].items():
                    val*=weights[key]
                    if val>maxVal:
                        maxStr=key
                        maxVal=val
                if (maxVal<threshold):
                    continue
                print(str(emotions[maxStr])+": "+str(maxVal))
                try:
                    requests.post(url, data = {'emotion': emotions[maxStr]}, verify=True)
                except:
                    continue
            else:
                cv2.imshow('screen', frame)
                if cv2.waitKey(1) & 0xFF == 27:
                    break

    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()