package userpackage;

public class TestSchedualDA {
	public static void main(String[] args){
	Schedual schedualOne;
	SchedualDA.initialize();
		try{SchedualDA.update("2015.02.15","kiss her","xiaobao");}
		catch(NotFoundException ee){}
	SchedualDA.terminate();
}
}