% Enhanced CDMA Signal Transmission and Reception with Additional Features

% Take input from the user
num_users = input('Enter the number of users: ');    % Number of users
num_bits = input('Enter the number of bits: ');      % Number of bits
max_snr = input('Enter the maximum SNR in dB: ');    % Maximum SNR in dB

% Generate spreading codes
spreading_codes = randi([0, 1], num_users, num_bits);

% Create array to store BER values for different SNR levels
snr_values = 0:max_snr;
ber_values = zeros(size(snr_values));

% Perform simulation for each SNR level
for snr_idx = 1:length(snr_values)
    noise_power = 10^(-snr_values(snr_idx)/10);
    noise = sqrt(noise_power) * randn(num_users, num_bits);
    received_signal = spreading_codes + noise;
    recovered_signal = received_signal .* spreading_codes;
    num_errors = sum(sum(abs(spreading_codes - recovered_signal)));
    ber_values(snr_idx) = num_errors / (num_users * num_bits);
end

% Plot BER vs. SNR curve
figure;
plot(snr_values, ber_values, 'b', 'LineWidth', 1.5);
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs. SNR');
grid on;

% Find SNR with minimum BER
[min_ber, min_ber_idx] = min(ber_values);
optimal_snr = snr_values(min_ber_idx);
fprintf('Optimal SNR with minimum BER: %d dB\n', optimal_snr);

% Calculate SNR from received signals
received_energy = sum(received_signal(:).^2);
noise_energy = sum(noise(:).^2);
snr_received = 10 * log10(received_energy / noise_energy);
fprintf('SNR calculated from received signals: %.2f dB\n', snr_received);

% Plot received signals for optimal SNR alongside original signals
optimal_snr_idx = find(snr_values == optimal_snr);
figure;
for i = 1:num_users
    subplot(num_users,1,i);
    stem(1:num_bits, spreading_codes(i,:), 'b', 'LineWidth', 1.5);
    hold on;
    stem(1:num_bits, received_signal(i,:), 'r', 'LineWidth', 1.5);
    xlabel('Bit Index');
    ylabel('Signal');
    title(['Original vs. Received Signal (User ' num2str(i) ')']);
    legend('Original', 'Received');
end

% Display total energy of original and received signals
original_energy = sum(spreading_codes(:).^2);
fprintf('Total energy of original signals: %.2f\n', original_energy);
fprintf('Total energy of received signals: %.2f\n', received_energy);

% Plot Power Spectral Density (PSD) of received signals
figure;
for i = 1:num_users
    subplot(num_users,1,i);
    [pxx, f] = pwelch(received_signal(i,:), [], [], [], 'twosided');
    plot(f, 10*log10(pxx), 'r', 'LineWidth', 1.5);
    xlabel('Frequency (Hz)');
    ylabel('Power/Frequency (dB/Hz)');
    title(['Power Spectral Density (User ' num2str(i) ')']);
end

% Plot histograms of original and received signals for each user
figure;
for i = 1:num_users
    subplot(num_users,2,2*i-1);
    histogram(spreading_codes(i,:), 'FaceColor', 'b');
    xlabel('Signal Value');
    ylabel('Frequency');
    title(['Original Signal Histogram (User ' num2str(i) ')']);

    subplot(num_users,2,2*i);
    histogram(received_signal(i,:), 'FaceColor', 'r');
    xlabel('Signal Value');
    ylabel('Frequency');
    title(['Received Signal Histogram (User ' num2str(i) ')']);
end

% Additional Feature: Diversity Techniques
% Maximal Ratio Combining (MRC) Diversity Technique:

% Calculate weights for MRC
weights = snr_values / max(snr_values);

% Apply MRC to received signals
mrc_received_signal = zeros(size(received_signal));
for i = 1:num_users
    mrc_received_signal(i, :) = received_signal(i, :) * weights(i);
end

% Plot received signals after MRC for optimal SNR alongside original signals
figure;
for i = 1:num_users
    subplot(num_users,1,i);
    stem(1:num_bits, spreading_codes(i,:), 'b', 'LineWidth', 1.5);
    hold on;
    stem(1:num_bits, mrc_received_signal(i,:), 'g', 'LineWidth', 1.5); % MRC received signal
    xlabel('Bit Index');
    ylabel('Signal');
    title(['Original vs. MRC Received Signal (User ' num2str(i) ')']);
    legend('Original', 'MRC Received');
end
