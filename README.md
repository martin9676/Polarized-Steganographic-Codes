# Sub-Polarized Steganographic Codes (SPSC)

This repository contains the released version of the Sub-Polarized Steganographic Codes (SPSC).  
Developed in C++20 and compiled in MATLAB MEX file.  

**Haocheng Fu, Xianfeng Zhao and Xiaolei He, [High-Performance Steganographic Coding Based on Sub-Polarized Channel](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/publications/high-performance.steganographic.coding.based.on.sub-polarized.channel.pdf)**  
State Key Laboratory of Information Security, Institute of Information Engineering, Chinese Academy of Sciences  
This work has been accepted by [the 21st International Workshop on Digital-forensics and Watermarking (IWDW 2022)](http://iwdw.site/), Guilin, China, 19-21 November, 2022.  


### About SPSC

SPSC is a steganographic coding scheme that is designed with polar codes and successive cancellation-based decoding schemes. Compared with Syndrome-Trellis Codes (STC), the SPSC has higher embedding efficiency with lower coding complexity. It can be easily extended and further improved according to the requirements of the specific task. SPSC is a new type of near-optimal steganographic code that very suitable for large-scale practical steganography applications.  

***The comments and suggestions are welcomed by all interested researchers. We also recommend generating stego samples with these MEX functions as well as comparing this with other prominent coding schemes with any type of covers under any distortion functions. We would be very grateful if you could send us comparison results with the [template](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/result-template.xlsx) we prepared, or you could just feedback us in the [Issues Section](https://github.com/martin9676/Polarized-Steganographic-Codes/issues) with [Markdown table](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/result-template.md).***  

The Toolbox of STC (also containing MEX functions) can be donwloaded at [here](http://dde.binghamton.edu/download/syndrome/).  
Please download MEX function(s) of the SPSC series in the [Releases Section](https://github.com/martin9676/Polarized-Steganographic-Codes/releases) of this repository.  
The interface of the released version of SPSC could be referred at the [Wiki Page](https://github.com/martin9676/Polarized-Steganographic-Codes/wiki/SPSC:-Sub-Polarized-Steganographic-Codes).  

### Current Road map

- [x] binary Sub-Polarized Steganographic Codes (bSPSC)
- [ ] ternary Sub-Polarized Steganographic Codes (tSPSC)

The current executable functions of SPSC is a [pre-released version](https://github.com/martin9676/Polarized-Steganographic-Codes/releases). Except that the calculation of optimal embedding probabilities is accelerated using SIMD instructions, the main part of this implementation **does not use any acceleration/optimization strategy**. Some acceleration methods might be introduced in the future release if possible.  

### Contact us

Martin Fu: martin9676@hotmail.com

### Performance

 - The comparison results of the embedding efficiency $e=M/D(\mathbf{y})$ under the square profile.  
![Efficiency](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/efficiency.png)  
 - The anti-analysis perofrmance on image steganography, BOSSBase images sized 512 of JPEG quality 85.  
![Steganalysis,QF85](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/steganalysis85.png)  
 - The anti-analysis perofrmance on image steganography, BOSSBase images sized 512 of JPEG quality 90.  
![Steganalysis,QF90](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/steganalysis90.png)  

### Prerequisites

 - Windows operating system
 - Microsoft Visual C++ Redistributable 2022 [(Link)](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170)
 - MATLAB R2020a

### Getting Started

 - Download the MEX function(s) from the [Releases Section](https://github.com/martin9676/Polarized-Steganographic-Codes/releases) of this repository.  
 - Clone this repository and enter the `library` folder.  
 - Put the downloaded MEX function file(s) in this folder. 
 - Enter the `examples` folder of the cloned repository.  
 - Execute the example script corresponding to the specific coding method.  

### Attentions

The all released MEX are compiled with MATLAB R2020a and MSVC 14.32.31326.  
All codes are tested on MATLAB R2020a and Windows 10 Pro for Workstations 21H2.  
Note that currently only the Windows platform with 64-bit architecture is supported.  

### Acknowledgement

This work was supported by NSFC under 61972390, 61902391, 61872356 and 62272456, and National Key Technology Research and Development Program under 2022QY0101.
