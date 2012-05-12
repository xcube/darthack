
class GameSounds {

  GameSounds() {

  }

  void playExplosion() {

    AudioContext audioContext = new AudioContext();
    AudioGainNode gainNode = audioContext.createGainNode();
    XMLHttpRequest xhr = new XMLHttpRequest();
    xhr.open("GET", "sound/explosion.mp3", true);
    xhr.responseType = "arraybuffer";

    xhr.on.load.add((e) {
      // asynchronous decoding
      audioContext.decodeAudioData(xhr.response, (buffer) {
        playSound() {
          AudioBufferSourceNode source = audioContext.createBufferSource();
          source.connect(gainNode, 0, 0);
          gainNode.connect(audioContext.destination, 0, 0);
          source.buffer = buffer;
          source.noteOn(0);
        }
        //playSound();
      }, (error) {
        print('Error decoding MP3 file');
      });
    });

    //xhr.send();
  }
}
