module testrobo;
  reg initial_Clock,Clock,Head,Left;
  wire Front,Rotate;
  
  // mod-6
  parameter Clock_frequency = 6;
  
  
  main #(Clock_frequency) main(initial_Clock, Clock, Head, Left, Front, Rotate);
  
  always #1 initial_Clock <= ~initial_Clock;
    
  initial begin
    Clock = 0;
    initial_Clock = 0;
    step(0,0);
    step(0,0);
    step(1,0);
    step(0,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(1,0);
    step(0,0);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(0,0);
    step(0,0);
    step(0,1);
    step(0,0);
    step(0,0);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,1);
    step(0,0);
    step(0,0);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,0);
    step(0,0);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,1);
    step(0,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(0,0);
    step(0,0);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    step(0,1);
    step(0,1);
    step(1,1);
    step(1,0);
    step(0,0);
    step(0,1);
    #1 $finish;
  end
  
  task step(input head,left); begin 
    #(Clock_frequency) begin
    Head = head;
    Left = left;
    end 
    #(Clock_frequency) display;
	end
  endtask
  
  task display;
  $strobe("Time:%d Head: %b,Left: %b,Front: %b,Rotate: %b, Clock: %b",$time,Head,Left,Front,Rotate,Clock);
 endtask
endmodule