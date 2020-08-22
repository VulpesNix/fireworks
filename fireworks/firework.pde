public class firework{
	Particle firework;
	color c;
	PVector pos;
	boolean exploded = false;
	ArrayList<Particle> particles = new ArrayList(35);
	int ctr = 0;
	firework(PVector start,color z){
		pos = start.copy();
		firework = new Particle(pos.x,pos.y,z,0.4);
		this.c = z;
	}
	void update(){
		pos = firework.pos;
		explode();
		firework.run();
		firework.show();
		if(particles.size() > 0){
			for(int i = 0;i < particles.size();i++){
				if(particles.get(i).isDead()){
					particles.remove(i);
				}else{
					particles.get(i).run();
				}
			}
		}
	}
	boolean done(){
		if(particles.size() <= 0){
			return true;
		}
		return false;
	}
	boolean isDead(){
		return (exploded&&done());
	}
	void explode(){
		if(firework.vel.y >= 0&&!exploded){
			for(int i = 0;i< 35;i++){
				Particle P = new Particle(pos,this.c);
				particles.add(P);
			}
			exploded=true;
			firework.live = 0;
		}
		
	}
}