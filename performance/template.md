## Report for performance comparison of STC and SPSC

**Author**: *Author name*  
**Institution**: *anonymous*  

**Distortion/Profile**: *You are expected to input the type of cover media and describe adopted steganographic distortion functions here, such as IMAGE/J-UNIWARD. A distortion profile is also accepted if you are evaluating embedding efficiency.*  
**Steganalytic tools**: *Here, the name of tools used for steganalysis is expected, e.g., DCTR.*  
**Source of the cover**: *The source of cover is required here, e.g., 10,000 BOSSBase in grayscale, size 512*512, or randomly generated sequence, length of 2^20.*  
**Evaluation platform**: *Detailed information on the device platform for your evaluation. At least the version of the operating system and CPU model is required.*  

#### The detection error rate (in %) of the steganalysis tools / The embedding efficiency of the compared methods

 - **Group 1**: *e.g., Image steganography on BOSSBase with J-UNIWARD distortion.* 

|Payload $\alpha$|STC-h8|STC-h12|STC-h16|SPSC-L1|SPSC-L4|SPSC-L16|
|----|----|----|----|----|----|----|
|0.2bpnzAC|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|
|0.4bpnzAC|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|

 - **Group 2**: *e.g., Embedding efficiency evaluated under the square profile with the cover length of 2^20.* 

|$1/\alpha$|STC-h8|STC-h12|STC-h16|SPSC-L1|SPSC-L4|SPSC-L16|
|----|----|----|----|----|----|----|
|4|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|
|10|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|
|16|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|
|20|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|0.0000/0.00|


**Brief conclusion**: *Briefly describe the results of the evaluation conducted, e.g., In this experiment, is clear that SPSC has a prior anti-detection performance than the STC since the detection error rate of which is higher.* 
