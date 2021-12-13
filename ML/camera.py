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
    faceCascade=cv2.CascadeClassifier('D:\Downloads\opencv-master\opencv-master\data\haarcascades\haarcascade_frontalface_default.xml')

    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        cap=cv2.VideoCapture(1)
    if not cap.isOpened():
        raise IOError("Cannot open webcam")

    while True:
        ret,frame = cap.read()
        try:
            result=DeepFace.analyze(frame,actions=['emotion'],enforce_detection=False)
        except:
            continue

        font=cv2.FONT_HERSHEY_SIMPLEX

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        rects = faceCascade.detectMultiScale(gray, 1.3, 2)
        if len(rects) >= 0:
            for (x, y, w, h) in rects:
                cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)
        cv2.putText(frame,result['dominant_emotion'],(50,50),font,1,(0,0,255),2,cv2.LINE_4)
        cv2.imshow('Camera',frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()