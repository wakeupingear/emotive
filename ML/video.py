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
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'  # FATAL
    logging.getLogger('tensorflow').setLevel(logging.FATAL)
    emotions={
        'neutral':0,
        'angry':1,
        'disgust':2,
        'fear':3,
        'happy':4,
        'sad':5,
        'surprise':6
    }

    """
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        cap=cv2.VideoCapture(1)
    if not cap.isOpened():
        raise IOError("Cannot open webcam")
    """

    maxStr=""
    maxVal=0
    old_stdout = sys.stdout

    bounding_box = {'left': 160, 'top': 160, 'width': 200, 'height': 200}
    sct = mss()
    while True:
        sct_img = sct.grab(bounding_box)
        frame=np.array(sct_img)

        if (isPosition != "true"):
            #sys.stdout = open(os.devnull, "w")
            result=DeepFace.analyze(frame,enforce_detection=False,models=('emotion'))
            #sys.stdout = old_stdout # reset old stdout
            maxStr=""
            maxVal=0
            
            for key,val in result["emotion"].items():
                if val>maxVal:
                    maxStr=key
                    maxVal=val
            print(emotions[maxStr])
            requests.post(url, data = {'emotion': emotions[maxStr]})
        else:
            cv2.imshow('screen', frame)
            if cv2.waitKey(1) & 0xFF == 27:
                break

    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()