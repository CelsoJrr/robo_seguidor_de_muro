module mealy(Clock,Head,Left,Front,Rotate);
  input Clock,Head,Left;
  output reg Front,Rotate;
  
  reg [1:0] EstadoAtual, EstadoFuturo;
  
  parameter ProcurandoMuro = 2'b00,
  			SeguindoMuro = 2'b01,
  			Rotacionando = 2'b10;
  
  always @(negedge Clock) begin
    EstadoAtual <= EstadoFuturo;
  end
 
  
  
  always @(Head or Left or EstadoAtual)begin
     case(EstadoAtual)
      ProcurandoMuro:  case({Head,Left})
        				2'b00: begin
                          EstadoFuturo = ProcurandoMuro;
                          Front = 1'b1;
                          Rotate = 1'b0;
                        end
                        2'b01: begin
                          EstadoFuturo = SeguindoMuro;
                          Front = 1'b1;
                          Rotate = 1'b0;
                        end
                        2'b10: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      				    2'b11: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      endcase
    
    SeguindoMuro:  case({Head,Left})
        				2'b00: begin
                          EstadoFuturo = ProcurandoMuro;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
                        2'b01: begin
                          EstadoFuturo = SeguindoMuro;
                          Front = 1'b1;
                          Rotate = 1'b0;
                        end
                        2'b10: begin
                          EstadoFuturo = ProcurandoMuro;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      				    2'b11: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      
      endcase
 
    Rotacionando:  case({Head,Left})
        				2'b00: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
                        2'b01: begin
                          EstadoFuturo = SeguindoMuro;
                          Front = 1'b1;
                          Rotate = 1'b0;
                        end
                        2'b10: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      				    2'b11: begin
                          EstadoFuturo = Rotacionando;
                          Front = 1'b0;
                          Rotate = 1'b1;
                        end
      endcase
      default begin 
       EstadoFuturo = ProcurandoMuro;
       Front = 1'b1;
       Rotate = 1'b0;
      end  
    endcase
  end  
endmodule

module Contador #(parameter Clock_frequency)(initial_Clock,Clock);
  input initial_Clock;
  output reg Clock;
  reg[2:0] Contar = 3'b000;
  
   always @(posedge initial_Clock) begin
        if (Contar < Clock_frequency - 1) begin
            Contar <= Contar + 1;
            Clock <= 0;
        end 
     else 
       begin
            Contar <= 0;
            Clock <= ~Clock;
        end
    end
  
endmodule

module main #(parameter Clock_frequency = 1) (initial_Clock, Clock, Head, Left, Front, Rotate);
    input initial_Clock, Clock, Head, Left;
    output Front, Rotate;

    Contador #(Clock_frequency) frequency(initial_Clock, Clock);
  mealy Mealy(Clock, Head, Left, Front, Rotate);
endmodule