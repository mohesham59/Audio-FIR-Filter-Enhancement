# Audio FIR Low-Pass Filter and Enhancement

This MATLAB project demonstrates how to design an FIR low-pass filter using a Hamming window and apply it to enhance recorded speech by reducing noise. The script also visualizes the frequency response of the filter before and after applying the Hamming window.

## Project Overview

The project consists of the following key steps:

1. **Filter Design**: 
   - The script designs an FIR low-pass filter based on user-specified passband and stopband frequencies.
   - The filter is created using a Hamming window to reduce ripples in the frequency response.

2. **Noise Addition**: 
   - The script adds noise to the input audio file to simulate a noisy environment for testing the filter.

3. **Noise Reduction**: 
   - The filter is applied to the noisy audio to enhance the speech and reduce unwanted noise.

4. **Visualization**: 
   - The frequency response of the FIR filter is visualized before and after applying the Hamming window.
   - The original, noisy, and filtered audio signals are plotted for comparison.

5. **Audio Playback**: 
   - The script plays the original noisy audio followed by the filtered audio to demonstrate the effect of the noise reduction.

## Project Files

- `audio_filtering.m`: The main script that performs the FIR filter design, noise addition, and audio enhancement.
- `drumloop.mp3`: A sample input audio file. You can replace it with your own file.

## Requirements

This project is implemented in MATLAB. Ensure you have the following MATLAB toolboxes:

- Signal Processing Toolbox
- Audio Toolbox

## Steps to Run the Code

1. Clone the repository or download the project files.
2. Make sure the input audio file (`drumloop.mp3`) is in the same directory as the script or update the path in the script to the location of your audio file.
3. Run the `audio_filtering.m` script in MATLAB. The script will:
   - Prompt you to select an audio file.
   - Design an FIR low-pass filter.
   - Add noise to the selected audio.
   - Apply the filter to the noisy audio.
   - Visualize the frequency response and plot the signals.
4. Listen to the noisy audio and the filtered output.

## Example

### Frequency Response Before and After Windowing:

- **Frequency Response without Hamming Window**
- **Frequency Response with Hamming Window**

### Audio Signals:

- **Original Input Audio**: The clean, original drum loop.
- **Noisy Input Audio**: The same signal with added noise.
- **Filtered Output Audio**: The result after applying the FIR low-pass filter.


