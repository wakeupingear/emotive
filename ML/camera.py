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
    faceCascade=cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        cap=cv2.VideoCapture(1)
    if not cap.isOpened():
        raise IOError("Cannot open webcam")

    while True:
        ret,frame = cap.read()
        result=DeepFace.analyze(frame,actions=['emotion'])

        font=cv2.FONT_HERSHEY_SIMPLEX

        cv2.putText(frame,result['dominant_emotion'],(50,50),font,1,(0,0,255),2,cv2.LINE_4)
        cv2.imshow('Camera',frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()