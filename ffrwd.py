import os,sys
import deepspeech
import wave
import numpy as np
import textwrap

ds_model=deepspeech.Model('/deepspeech/techiaith_bangor_20.09.pbmm')
ds_model.enableExternalScorer('/deepspeech/techiaith_bangor_transcribe_20.09.scorer')

w = wave.open('sain.wav','r')

frames = w.getnframes()
buffer = w.readframes(frames)

ds_stream = ds_model.createStream()

wrapper = textwrap.TextWrapper(width=80)
trans_so_far = ''

buffer_len = len(buffer)
offset = 0
batch_size  = 16384
text = ''

os.system('clear')

while offset < buffer_len:
    end_offset = offset + batch_size
    chunk = buffer[offset:end_offset]
    data16 = np.frombuffer(chunk, dtype=np.int16)
    ds_stream.feedAudioContent(data16)
    trans_so_far = ds_stream.intermediateDecode()
    lines = wrapper.wrap(text=trans_so_far)
    wrapped_trans = "\n".join(lines)
    sys.stdout.write("\x1b7\x1b[%d;%df%s\x1b8" % (0, 0, wrapped_trans))
    sys.stdout.flush()
 
    offset = end_offset

ds_stream.finishStream()


