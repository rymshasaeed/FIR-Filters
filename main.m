clc, clearvars, close all

% Specifications
Fs = 8e3;

% FIR Filters
lowpass = LowpassFilter(70, Fs, 700, 1000, 1);
highpass = HighpassFilter(50, Fs, 1600, 1800, 0);
bandpass = BandpassFilter(32, Fs, 750, 800, 1800, 1850, 0);
bandstop = BandstopFilter(30, Fs, 700, 800, 1800, 1900, 0);
peak = PeakFilter(60, Fs, 2000, 1);
notch = NotchFilter(60, Fs, 2000, 1);

% Frequency response
[h_lp, w_lp] = freqz(lowpass);
[h_hp, w_hp] = freqz(highpass);
[h_bp, w_bp] = freqz(bandpass);
[h_bs, w_bs] = freqz(bandstop);
[h_p, w_p] = freqz(peak);
[h_n, w_n] = freqz(notch);

% Plot frequency response of each filter
figure;
subplot(3,2,1)
plot(w_lp*Fs/2/pi, abs(h_lp)/max(abs(h_lp)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{lp}(j\omega)|')
title('Lowpass Filter')

subplot(3,2,2)
plot(w_hp*Fs/2/pi, abs(h_hp)/max(abs(h_hp)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{hp}(j\omega)|')
title('Highpass Filter')

subplot(3,2,3)
plot(w_bp*Fs/2/pi, abs(h_bp)/max(abs(h_bp)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{bp}(j\omega)|')
title('Bandpass Filter')

subplot(3,2,4)
plot(w_bs*Fs/2/pi, abs(h_bs)/max(abs(h_bs)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{bs}(j\omega)|')
title('Bandstop Filter')

subplot(3,2,5)
plot(w_p*Fs/2/pi, abs(h_p)/max(abs(h_p)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{p}(j\omega)|')
title('Peak Filter')

subplot(3,2,6)
plot(w_n*Fs/2/pi, abs(h_n)/max(abs(h_n)), 'LineWidth', 1.5)
grid on
xlabel('f(Hz)')
ylabel('|H_{n}(j\omega)|')
title('Notch Filter')

suptitle('FIR Filters')