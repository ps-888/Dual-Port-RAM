module dual_port_RAM(data_1, data_2, rd_wr1, rd_wr2, addr_1, addr_2, o1, o2, clk);
  input [7:0] data_1, data_2;    // input data bus
  input [9:0] addr_1, addr_2;    // address bus
  input rd_wr1, rd_wr2, clk;     // read/write signals and clock
  output reg [7:0] o1, o2;       // outputs
  
  reg [7:0] ram[1023:0];         // memory 

  // for port 1 
  always @(posedge clk)
    begin                     
      if (rd_wr1)
        ram[addr_1] <= data_1;
      else
        o1 <= ram[addr_1];
    end

  // for port 2
  always @(posedge clk)
    begin                     
      if (rd_wr2)
        ram[addr_2] <= data_2;
      else
        o2 <= ram[addr_2];
    end
endmodule 
