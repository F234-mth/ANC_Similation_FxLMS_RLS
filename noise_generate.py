import numpy as np
from scipy.io import wavfile
import os

input_filename = "output.wav"
print(f": {input_filename}")
fs, original_audio = wavfile.read(input_filename)

if len(original_audio.shape) > 1:
    original_audio = original_audio[:, 0]

noise_level = 2000 
noise = np.random.normal(loc=0, scale=noise_level, size=len(original_audio))

noisy_audio = original_audio + noise

noisy_audio = np.clip(noisy_audio, -32768, 32767)
noise_reference = np.clip(noise, -32768, 32767)


noisy_audio = noisy_audio.astype(np.int16)
noise_reference = noise_reference.astype(np.int16)


noisy_filename = "noisy_output.wav"
reference_filename = "noise_reference.wav"

wavfile.write(noisy_filename, fs, noisy_audio)
print(f" {os.path.abspath(noisy_filename)}")

# 保存纯噪音文件 (用于 ANC 的 Reference file)
wavfile.write(reference_filename, fs, noise_reference)
print(f" {os.path.abspath(reference_filename)}")