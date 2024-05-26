# Facial Expression Recognition using 34 Keypoints and SIFT Descrtiptor

## Abstract
Facial expressions are one of the most powerful and direct tools for people to connect with the feelings of other people. Facial expression recognition is one of the important issues raised in the fields of artificial intelligence and machine vision; and so far various methods have been introduced concerning facial expression recognition. Some of these methods have shortcomings such as sensitivity to changes in lighting, rotation, enlargement, and noise. The SIFT descriptor is one of the most widely used of these methods, and has great stability in the face of changes such as rotation, noise, and enlargement. Therefore, in this thesis, an attempt has been made to study this descriptor with the purpose of making it stable against some of these problems. One of the shortcomings of the SIFT method is that points on the face are obtained in a spatial scale, and, therefore, these points may not be effective in recognizing the facial expression. Therefore, in this research, the purpose has been to apply the SIFT descriptor on key points of the face which have been obtained in an intelligent manner, and which are effective in recognizing facial expressions. 
Implementations carried out in experiments conducted in this research indicate that the proposed algorithms, when tested on the database JAFFE, are superior to the base SIFT algorithm and to other algorithms introduced in this area. Results obtained show that with changes made in the base SIFT descriptor the rate of facial expression recognition improves by two percent, that less time is needed to conduct the test , and that the time required to extract the facial features is less than that needed to apply the SIFT descriptor on the whole face. 


## Proposed Method
- Face detection using Harr-like features
- Pre-processing (Convert image to grayscale color space , Resizing images to 128×128, Smoothing using histogram equalization) 
- Extract facial key points automatically (Image binarization, Integral image curves)
- Description of key points based on SIFT
- Database (JAFFE,Cohn-Kanade)

## Results
The system achieved an accuracy of 97.20% on the test dataset. Detailed results and analysis are provided in the report.

## Project History
This project was originally completed in 2011. The commit history has been adjusted to reflect the original dates of the work.


## How to Use
1. Go to Src folder and run 'Main_1.m'