import cv2
from deepface import DeepFace
import numpy as np
import os

def main():
    faceCas = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        cap=cv2.VideoCapture(1)
    if not cap.isOpened():
        raise IOError("Cannot open webcam")

    maxStr=""
    maxVal=0
    while True:
        ret, frame = cap.read()
        result=DeepFace.analyze(frame,enforce_detection=False)
        maxStr=""
        maxVal=0
        for key,val in result["emotion"].items():
            if val>maxVal:
                maxStr=key
                maxVal=val
        print(maxStr)

if __name__ == '__main__':
    main()