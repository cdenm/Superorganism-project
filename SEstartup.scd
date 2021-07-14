(
s.waitForBoot {
	~dirt = SuperDirt(2, s); // two output channels
	~dirt.loadSoundFiles("C://Users//calto//OneDrive//Documents//Live Coding//Tidal//samples//superorganism//*"); // specify sample folder to load
	s.sync; // wait for supercollider to finish booting up
	~dirt.start(57120, [0, 0]); // start superdirt, listening on port 57120, create two orbits each sending audio to channel 0
};
);

a = NetAddr.new("127.0.0.1", 12000);
OSCdef(\test, {a.sendMsg("/sendm", "outp")}, '/play2', n);