## CDMA Signal Transmission and Reception with Advanced Features

### What is CDMA?
CDMA, or Code Division Multiple Access, is a technique used in telecommunications to allow multiple users to transmit data simultaneously over a shared communication channel. In this MATLAB project, CDMA is implemented by generating spreading codes using the `randi` function.

### Overview
This MATLAB project demonstrates CDMA signal transmission and reception, featuring BER analysis, diversity techniques, and signal visualization.

### Functionality
1. **Input Parameters:**
   - Users input the number of users, bits, and maximum Signal-to-Noise Ratio (SNR) in dB.

2. **Signal Generation:**
   - The spreading codes are sequences of binary digits (0s and 1s) that are assigned to each user. These codes serve two main purposes: spreading the signal over a wider bandwidth and providing a unique signature for each user.
   - The `randi` function is used to randomly generate spreading codes for each user. It takes as input the range of values (0 and 1) and the size of the matrix (number of users by number of bits). By using `randi`, we ensure that the spreading codes are randomly generated, providing each user with a unique code.
   - Once the spreading codes are generated, they are used to modulate the data signals before transmission. During transmission, the modulated signals are spread across the available bandwidth using the assigned spreading codes. At the receiver end, the received signal is despread using the same spreading codes to extract the original data.
   - CDMA allows multiple users to transmit data simultaneously by spreading the signals across a wider bandwidth using unique spreading codes. This enables efficient use of the available spectrum and allows for increased capacity in communication systems without the need for separate frequency channels for each user.

3. **Simulation:**
   - Signals are transmitted and received across various SNR levels.
   - BER is calculated and plotted against SNR.
   - Optimal SNR with minimum BER is determined.
   - SNR is calculated from received signals.

4. **Signal Visualization:**
   - Original and received signals are plotted together for optimal SNR.
     ![Original and received signals](/CDMA_output_images/Figure_2.png)
     
     This set of plots displays the original binary signals (in blue) and the received signals (in red) for each user. It helps compare the transmitted signals with the signals received at the receiver end. Ideally, the received signals should closely match the original signals, indicating successful transmission.

     
   - Power Spectral Density (PSD) and histograms of signals are visualized.
     ![Power Structural Density](CDMA_output_images/Figure_3.png)
     
     These plots show the Power Spectral Density (PSD) of the received signals for each user. PSD represents the distribution of signal power over different frequencies. It helps analyze the frequency components present in the received signals, indicating the spectral characteristics of the transmitted data.
     
     ![Original Vs Regived Singal Histogram](CDMA_output_images/Figure_4.png)
     
     These histograms display the distribution of signal values for both the original (blue) and received (red) signals for each user. It provides insights into the signal amplitude distribution, indicating whether the received signals maintain the characteristics of the original signals.


5. **Diversity Techniques:**
   - Maximal Ratio Combining (MRC) is applied to improve signal reception.

### Objective
This project aims to understand CDMA system performance under different SNR levels by analyzing BER, exploring diversity techniques, and visualizing signal characteristics.

### Unique Features
1. **BER Analysis:** Provides insights into CDMA system BER performance under varying SNR conditions.
   ![BER Vs SNR graph](/CDMA_output_images/Figure_1.png)
   
   This graph shows the relationship between the Signal-to-Noise Ratio (SNR) and the Bit Error Rate (BER). The x-axis represents the SNR in dB, and the y-axis represents the BER. It helps visualize how the BER changes with varying SNR levels. A lower BER indicates better signal quality.

   
3. **Signal Visualization:** Offers visual representations of original and received signals for better understanding.

4. **Diversity Techniques:** Implements MRC to enhance signal reception in noisy environments.
   ![Original Vs MCR reciver signal graph](/CDMA_output_images/Figure_5.png)
   
   Similar to the previous set of plots, these graphs compare the original binary signals (in blue) with the signals received after applying Maximal Ratio Combining (MRC) technique (in green) for each user. MRC is a diversity technique used to improve signal reception. These plots show how MRC enhances the received signals compared to the original ones.


### Examples
Suppose 10 users transmit 100 bits each with a maximum SNR of 20 dB. This project can analyze BER and visualize signal characteristics for this scenario.

### Real-Life Applications
CDMA is widely used in communication systems like cellular networks, satellite communication, and wireless LANs.

### Future Aspects
Future enhancements may include implementing other diversity techniques like Selection Combining (SC) and Equal Gain Combining (EGC), integrating advanced modulation schemes, and optimizing for large-scale CDMA systems.

### How to Use
1. Input desired parameters.
2. Run MATLAB script `project_ADC_CDMA_advanced.m`.
3. Analyze generated plots and output data for insights.

Feel free to customize the code for specific scenarios or additional features.

### Contributor
- [Arijit Mondal](https://github.com/ariktheone) - [ariktheone](https://github.com/ariktheone)
  
As a student, this project aims to provide practical insights into CDMA systems and their performance analysis.
