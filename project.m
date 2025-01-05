% Design FIR low-pass filter and enhance recorded speech

% Prompt user to select an audio file
[filename, pathname] = uigetfile({'*.wav;*.mp3;*.ogg;*.flac;*.waptt'}, 'Select an Audio File');

% Check if the user canceled file selection
if isequal(filename, 0)
    disp('User canceled file selection');
else
    % Read the selected audio file
    fullFileName = fullfile(pathname, filename);
    [inputAudio, Fs] = audioread(fullFileName);

    % Define filter specifications
    passbandFreq = 1600; % Passband frequency in Hz
    stopbandFreq = 1800; % Stopband frequency in Hz
    passbandRipple = 0.02; % Passband ripple in dB
    stopbandAttenuation = 50; % Stopband attenuation in dB
    sampling_rate = 8000;
    cutoff_frequency = (passbandFreq + stopbandFreq) / 2;

    % Design a low-pass filter using a Hamming window
    N = 133; 
    M = (N-1)/2;    
    omega_c = 2*pi*cutoff_frequency/sampling_rate;
    n = -M:1:-1;
    h = sin(omega_c.*n)./(n*pi);
    h(M+1) = omega_c/pi;
    h(M+2:1:N) = h(M:-1:1);
    [H, W]=freqz(h,1,1024);  
    % Apply Hamming window
    w=hamming(N).'; 
    h_w=h.*w;   
    [HWindowed, WWindowed] = freqz(h_w, 1, 1024); 
    % Visualize frequency response before and after windowing
    figure;
    subplot(2, 1, 1);
    plot(W, abs(H));
    title('Frequency Response without Hamming Window');
    xlabel('Frequency');
    ylabel('Magnitude');
    subplot(2, 1, 2);
    plot(WWindowed, abs(HWindowed));
    title('Frequency Response with Hamming Window');
    xlabel('Frequency');
    ylabel('Magnitude');

    % Add noise to the input audio
    noisyInput = awgn(inputAudio, 30);

    % Apply the low-pass filter to the noisy audio
    filteredAudio = filter(h_w, 1, noisyInput);

    % Plot the input, noisy, and filtered output signals
    figure;
    subplot(3, 1, 1);
    plot(inputAudio);
    title('Original Input Audio');
    subplot(3, 1, 2);
    plot(noisyInput);
    title('Noisy Input Audio');
    subplot(3, 1, 3);
    plot(filteredAudio);
    title('Filtered Output Audio');

    % Play the noisy audio
    sound(noisyInput, Fs);
    pause(length(noisyInput) / Fs);

    % Play the filtered noisy audio
    sound(filteredAudio, Fs);
end
