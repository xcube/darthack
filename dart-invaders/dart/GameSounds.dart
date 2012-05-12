
class GameSounds {

  AudioContext audioContext;
  AudioGainNode gainNode;

  GameSounds() {
    audioContext = new AudioContext();
    gainNode = audioContext.createGainNode();
  }

  void playSound(String url) {

    XMLHttpRequest xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.responseType = "arraybuffer";

    xhr.on.load.add((e) {
      // asynchronous decoding
      audioContext.decodeAudioData(xhr.response, (buffer) {
        AudioBufferSourceNode source = audioContext.createBufferSource();
        source.connect(gainNode, 0, 0);
        gainNode.connect(audioContext.destination, 0, 0);
        source.buffer = buffer;
        source.noteOn(0);
      }, (error) {
        print('Error decoding ogg file');
      });
    });

    xhr.send();
  }

  void playExplosion() {
    playSound("sound/explosion.ogg");
  }

  void playFire() {
    playSound("sound/fire.ogg");
  }
}
