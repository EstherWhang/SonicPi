# Welcome to Sonic Pi

#note guide: write it as :c5 and such.cs is c sharp and eb is e flat
use_bpm 130
whichVariation = 0
volume = 0.5
mainSynth = :sine
define :mybeat1 do
  sample :perc_snap
  sleep 0.333333
  sample :drum_bass_soft
  sleep 0.3333333
  sample :drum_heavy_kick
  sleep 0.3333333
  sample :perc_snap
  sleep 1.66666
  sample :drum_heavy_kick
  sleep 0.33333
end

define :layerOne do
  3.times do
    play (chord :g3, :minor), amp: volume
    sleep 1
  end
  3.times do
    play (chord :bb2, :major, invert: 2), amp: volume
    sleep 1
  end
  3.times do
    play (chord :eb3, :major), amp: volume
    sleep 1
  end
  3.times do
    play (chord :fs3, :diminished), amp: volume
    sleep 1
  end
end

define :secondLayer do
  3.times do
    play (chord :bb3, :major, invert: 2)
    sleep 1
  end
  3.times do
    play (chord :f3, :major, invert: 2)
    sleep 1
  end
  3.times do
    play (chord :c4, :minor, invert: 1)
    sleep 1
  end
  3.times do
    play (chord :d4, :major, invert: 1)
    sleep 1
  end
  
end

define :secondPart do
  9.times do
    play (chord :g4, :minor, num_octaves: 1).tick, release:0.1
    sleep 0.333333
  end
  9.times do
    play (chord :f4, :major, num_octaves: 1).tick, release:0.1
    sleep 0.333333
  end
  9.times do
    play (chord :eb4, :major, num_octaves: 1).tick, release:0.1
    sleep 0.333333
  end
  9.times do
    play (chord :fs4, :diminished, num_octaves: 1).tick, release:0.1
    sleep 0.33
  end
end


define :firstHarmony do
  #12 beats
  
  if whichVariation > 2
    sleep 9
    play (:c5), release:(1), amp: volume
    sleep 1
    play (:a4), release:(1), amp: volume
    sleep 1
    play (:fs4), release:(1), amp: volume
    sleep 1
    
  else
    play (:g4), release:(3), amp: volume
    play (:bb4), release:(3), amp: volume
    sleep (3)
    play (:d5), release:(3), amp: volume
    play (:bb4), release:(2), amp: volume
    sleep (2)
    play (:a4), release: 1, amp: volume
    sleep 1
    play (:d5), release:(3), amp: volume
    play (:bb4), release:(3), amp: volume
    sleep 3
    play (:c5), release:(3), amp: volume
    play (:a4), release:(3), amp: volume
    sleep 3
    
  end
  
end

define :firstMotif do
  #12 beats
  
  
  #conditional here
  if whichVariation > 2
    play (:d5), release:(2)
    sleep (2)
    play (:f5), release:(1)
    sleep (1)
    play (:c5), release: 2
    sleep 2
    play (:f5), release:(1)
    sleep (1)
    play (:bb4), release: 2
    sleep 2
    play (:d5), release:(1)
    sleep (1)
    play (:a4), release: 1.5
    sleep 1.5
    play (:bb4), release:(0.5)
    sleep 0.5
    play (:a4), release:(1)
    sleep 1
  else
    play (:g4), release:(2)
    sleep (2)
    play (:bb4), release:(1)
    sleep (1)
    play (:f4), release: 2
    sleep 2
    play (:bb4), release:(1)
    sleep (1)
    play (:eb4), release: 2
    sleep 2
    play (:g4), release:(1)
    sleep (1)
    play (:a4), release: 1.5
    sleep 1.5
    play (:g4), release:(0.5)
    sleep 0.5
    play (:fs4), release:(1)
    sleep 1
  end
  
  
end

in_thread do
  5.times do
    with_synth mainSynth  do
      firstMotif
    end
    whichVariation = whichVariation + 1
  end
end
sleep 12
in_thread do
  with_synth :tri   do
    3.times do
      layerOne
    end
  end
end
sleep 12
in_thread do
  6.times do
    with_synth mainSynth do
      firstHarmony
    end
  end
end
sleep 12
in_thread do
  8.times do
    mybeat1
  end
end
sleep 24
in_thread do
  volume = 1
  with_synth mainSynth do
    2.times do
      secondPart
    end
  end
end
sleep 12
in_thread do
  4.times do
    mybeat1
  end
end
with_synth :tri do
  2.times do
    secondLayer
  end
end

sleep 24








