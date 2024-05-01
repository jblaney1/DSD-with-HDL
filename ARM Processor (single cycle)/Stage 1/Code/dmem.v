// dmem.v
// Very simple data memory for ARM single-cycle model.
// "Digital Design and Computer Architecture ARM EDITION," S.L. Harris and D.M. Harris.
// EE 4490 adapted from code by Jerry C. Hamann

module dmem(RD,A,WD,WE,clk);
  output  [31:0]  RD;
  input   [31:0]  A, WD;
  input           WE, clk;
  

  reg     [31:0]  RD;

  reg     [31:0]  dMem [7:0];

  always @(posedge clk)
    if(WE)
      dMem[A[4:2]] <= WD;

  always @(A,dMem[A[4:2]])
    RD = dMem[A[4:2]];
endmodule
