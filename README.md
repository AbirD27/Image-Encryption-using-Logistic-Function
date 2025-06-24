 Image Encryption Using Logistic Function

 🔒 Overview
This MATLAB project presents a chaos-based image encryption system leveraging the logistic map, a nonlinear mathematical function exhibiting chaotic behavior. The method introduces pseudo-randomness through logistic sequences and secures grayscale images using multi-stage bitwise XOR encryption. The primary goal is to ensure image confidentiality, integrity, and resistance against unauthorized access and cryptographic attacks.

🎯 Objectives
Implement a lightweight image encryption system using chaotic logistic maps.

Enhance security via multi-round XOR operations.

Analyze robustness using statistical measures such as correlation, entropy, NPCR, and UACI.

Ensure complete reversibility through key-based decryption.

Achieve practical performance suitable for real-time and low-resource environments.


🛠️ Tools and Technologies
Language: MATLAB (R2021a)

Encryption Method: Logistic Map + XOR Operations

Test Images: Lena, Baboon, Boat, Peppers

Metrics Used: Entropy, NPCR, UACI, Correlation Coefficient, Histogram


⚙️ Methodology
Input Handling
Load grayscale image and convert it into a 2D matrix.

Chaotic Key Generation
Generate pseudo-random sequences using logistic map:

𝑥
𝑛
+
1
=
𝑟
⋅
𝑥
𝑛
⋅
(
1
−
𝑥
𝑛
)
x 
n+1
​
 =r⋅x 
n
​
 ⋅(1−x 
n
​
 )
where 
0
<
𝑥
0
<
1
0<x 
0
​
 <1, 
3.57
<
𝑟
≤
4
3.57<r≤4

Encryption Process

Three chaotic matrices are generated.

Apply three-stage XOR:

matlab
Copy
Edit
Ienc1 = bitxor(inputImage, chaoticMatrix1);
Ienc2 = bitxor(Ienc1, chaoticMatrix2);
Ienc3 = bitxor(Ienc2, chaoticMatrix3);
Decryption Process

Reverse the XOR steps with same keys:


Idec2 = bitxor(Ienc3, chaoticMatrix3);
Idec1 = bitxor(Idec2, chaoticMatrix2);
outputImage = bitxor(Idec1, chaoticMatrix1);


🔐 Security Evaluation
Correlation Coefficient: Dropped from >0.95 to near-zero post-encryption.

Entropy: Improved from ~7.1 to ~7.999 (close to ideal 8 for 8-bit images).

NPCR: Achieved ~99.58% pixel change rate with slight key change.

UACI: Recorded values above 30%, indicating strong pixel intensity variation.

Histogram: Original patterns replaced by uniform distribution.


📌 Key Features
High sensitivity to initial parameters (key-dependent)

Lightweight and efficient encryption/decryption

Suitable for secure image storage and transmission

Resistant to brute-force, statistical, and differential attacks


🔄 Sample Parameters
Initial Value (x₀): 0.3456

Control Parameter (r): 3.99

Image Size: 256 x 256 pixels



📈 Applications
Secure image sharing over public networks

Medical and military imaging

Cloud image storage

IoT-based image surveillance

Copyright protection and digital watermarking



🚀 Future Enhancements
Support for color images (RGB encryption)

Integration with AES/RSA for hybrid cryptography

Real-time performance optimization using GPU or parallel processing

Application in mobile platforms and IoT devices
