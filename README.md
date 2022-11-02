# Sub-Polarized Steganographic Codes (SPSC)

This repository contains the released version of the Sub-Polarized Steganographic Codes (SPSC).  
Developed in C++20 and compiled in MATLAB MEX file.  

SPSC is a steganographic coding schemes that are designed with polar codes and successive cancellation-based decoding schemes. Compared with Syndrome-Trellis Codes (STC), the SPSC has higher embedding efficiency with lower coding complexity. It can be easily extended and further improved according to the requirements of the specific task. SPSC is a new type of near-optimal steganographic code that very suitable for large-scale practical steganography applications.  

***The comments and suggestions are welcomed by all interested researchers. We also recommend generating stego samples with these MEX functions as well as comparing this with other prominent coding schemes with any type of covers under any distortion functions. We would be very grateful if you could send us comparison results with the [template](https://github.com/martin9676/Polarized-Steganographic-Codes/blob/main/performance/template.xlsx) we prepared.***  

The Toolbox of STC (also containing MEX functions) can be donwloaded at [here](http://dde.binghamton.edu/download/syndrome/).  
Please download MEX function(s) of the SPSC series at the [Releases section](https://github.com/martin9676/Polarized-Steganographic-Codes/releases) of this repository.  

### Current Road map

- [x] binary Sub-Polarized Steganographic Codes (bSPSC)
- [ ] ternary Sub-Polarized Steganographic Codes (tSPSC)

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

 - Download the MEX function(s) from the [Releases section](https://github.com/martin9676/Polarized-Steganographic-Codes/releases) of this repository.  
 - Clone this repository and enter the `library` folder.  
 - Put the downloaded MEX function file(s) in this folder. 
 - Enter the `examples` folder of the cloned repository.  
 - Execute the example script corresponding to the specific coding method.  

### Attentions

The all released MEX are compiled with MATLAB R2020a and MSVC 14.32.31326.  
All codes are tested on MATLAB R2020a and Windows 10 Pro for Workstations 21H2.  
Note that currently only the Windows platform with 64-bit architecture is supported.  

### Acknowledgement

Thanks the Digital Data Embedding Laboratory at Binghamton University for providing the compiled MEX version of the [Phil Sallee’s MATLAB JPEG Toolbox](http://dde.binghamton.edu/download/jpeg_toolbox.zip).  
Thanks the Digital Data Embedding Laboratory at Binghamton University for providing the MATLAB source code of the [J-UNIWARD distortion function](http://dde.binghamton.edu/download/stego_algorithms/).  
Thanks Mach for providing the MATLAB source code of re-implementation of the [UERD distortion function](https://github.com/mach-ms/UERD).
