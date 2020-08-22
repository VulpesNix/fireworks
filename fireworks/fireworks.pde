PVector gravity = new PVector(0,0.02);
// firework fireworks = new firework();
ArrayList<firework> fireworks = new ArrayList();
void setup(){
	fullScreen(P2D);
	// size(600,600,P2D);
	strokeWeight(3);
	background(0);
}
void draw(){
	fill(0,50);
	noStroke();
	rect(0,0,width,height);
	if(random(1) > 0.90){
		for(int i = 0;i < floor(random(5));i++){
			PVector start = new PVector(random(0, width),height);
			color x = color(random(255),random(255),random(255));
			firework p = new firework(start,x);
			fireworks.add(p);
		}
	}
	for(int i = 0;i< fireworks.size();i++){
		fireworks.get(i).update();
		if(fireworks.get(i).isDead()){
			fireworks.remove(i);
		}
	}
	// println(fireworks.size());
}