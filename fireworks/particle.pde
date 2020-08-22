public class Particle {
	PVector pos;
	color c;
	PVector vel;
	PVector acc;
	PVector previusPos;
	float maxSpeed;
	float live = 255;
	float inc = 0.4;
	boolean f;
	Particle(float x,float y,color c,float incc){
		pos = new PVector(x,y);
		vel = new PVector(0,random(-5.5,-4.5));
		acc = new PVector(0,0);
		previusPos = pos.copy();
		this.c = c;
		this.inc = incc;
		this.f = true;
	}
	Particle (PVector start,color c){
		pos = start.copy();
		vel = PVector.random2D();
		vel.mult(random(5));
		acc = new PVector(0,0);
		this.c = c;
		this.inc = 2;
		this.f = false;
	}
	void run(){
		update();
		show();
	}
	void update(){
		if(!f){
			vel.mult(random(0.95,1));
		}
		this.c = color(red(c),green(c),blue(c),live);
		pos.add(vel);
		vel.add(acc);
		acc.mult(0);
		applyForce(gravity);
		live -= inc;
	}
	boolean isDead(){
		if(live <= 0 || pos.y > height){
			return true;
		}
		else{
			return false;
		}
	}
	void applyForce(PVector force){
		acc.add(force);
	}
	void show(){

		stroke(c,live);
	    point(pos.x,pos.y);
		//line(pos.x, pos.y, previusPos.x,previusPos.y);
	}
}
