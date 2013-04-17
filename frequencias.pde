/*********************************************/ 
import ddf.minim.analysis.*;
import ddf.minim.*;
/*********************************************/ 

/*********************************************/  
Minim minim;
AudioPlayer som;
AudioInput in;
FFT fftLog;

boolean mic;

float freq[] = new float[100];
/*********************************************/ 

/*********************************************/ 
void setupFrequencias(String arq ) {
  minim = new Minim(this);
  
  som = minim.loadFile(arq, 2048);
  
  fftLog = new FFT(som.bufferSize(), som.sampleRate());
  fftLog.logAverages(22,3);
  
  for (int i = 0; i < 100; i++) {
    freq[i] = 0;
  }
  som.play();
  
  mic = false;
} 

/*********************************************/ 
void setupMic() {
  minim = new Minim(this);
  
  in = minim.getLineIn(Minim.STEREO, 512);
  
  fftLog = new FFT(in.bufferSize(), in.sampleRate());
  fftLog.logAverages(22,3);
  
  for (int i = 0; i < 100; i++) {
    freq[i] = 0;
  }

  mic = true;
} 

/*********************************************/ 
void calculaFrequencias() {
  if (!mic) fftLog.forward(som.mix);
  else fftLog.forward(in.mix);
}

/*********************************************/ 
float freq(int k) {
  if (k >= fftLog.avgSize()) k = fftLog.avgSize()-1;
  freq[k] += (fftLog.getAvg(k) - freq[k])/30;
  return freq[k];
}

/*********************************************/ 
void stop()
{
  som.close();
  minim.stop(); 
  super.stop();
}


